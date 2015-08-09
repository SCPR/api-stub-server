# API Stub Server
A basic HTTP server to deliver canned API responses. Use this to test API responses without having to worry about rate limiting, service availability, etc.

This is especially useful for testing Preroll responses on mobile apps without having to work around the campaign schedule and other limiting factors.

## Adding a response
Copy a response that you want to test into a new file in the `fixtures/` directory. The server runs with `fixtures/` as its root and will serve any file from that directory.

## Running the server
From the command line, run:

```bash
./run.sh
```

The server chooses a private ipv4 address (not loopback) from your ifconfig to bind to.

## Pointing your app at the server
The script will tell you the URL to point your app at. **As long as you're on the same network**, your app should be able to connect.

For example:

```java
String PREROLL_BASE = "http://192.168.100.16:5000/preroll/BasicTritonPreroll.xml/?adrawdata/3.0/5511.1/3590533/0/0/header=yes;cookie=no;adct=text/xml;guid=%s:%s";
```

## Remember!
Anybody on the same network can access the server and view any of the fixture files.
