## Steps

1. Create a user webadmin.
   
   ```bash
   sudo adduser webadmin
   ```

2. Using visudo configure the commands members of the group webadmin can run. Add to `/etc/sudoers` using `visudo`
   
   ```
   %webadmin ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart nginx, /usr/bin/systemctl start nginx, /usr/bin/systemctl status nginx, /usr/bin/systemctl enable nginx, /usr/sbin/nginx -s reload
   ```

3. Add the user `www-data` to the group `webadmin`.
   
   ```
   sudo usermod -aG webadmin www-data
   ```

4. Change the permissions to the home folder of webadmin to `read` for all files and `execute` for all directories within. 
   
   - *For scripts remove the execute for added security.*
     
     ```
     sudo chmod -R g+rx /home/webadmin
     ```

5. Configure `nginx`.

## Miscellaneous

---

- Add  ` limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;` to the http block.

- It sets up a shared memory zone to keep track of the state of requests for different keys (e.g., IP addresses).
  
  - $binary_remote_addr: Uses the client's IP address as the key for tracking requests.
  - zone=one:10m: Creates a shared memory zone named "one" with a size of 10 megabytes.
  - rate=1r/s: Sets the limit to 1 request per second per IP address tracked in this zone.

- Add `limit_req zone=one burst=5 nodelay;` to the server location block in the sites enabled. 
  
  - zone=one: Applies the rate limiting defined in the "one" zone.
  - burst=5: Allows a client to make up to 5 requests above the defined rate in a short burst. Excess requests are delayed.
  - nodelay: Excess requests are rejected immediately without delay.

- For more info visit [documentation](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html) or this [article](https://umatechnology.org/how-to-use-rate-limiting-on-nginx/).

---
