#!/usr/bin/env bash

# - https://superuser.com/questions/149329/what-is-the-curl-command-line-syntax-to-do-a-post-request
# - https://unix.stackexchange.com/questions/409363/what-is-the-meaning-of-curl-k-i-x-in-linux - describes the -k flag

# - Use the -k flag to instruct curl to skip SSL verification if the server is using a self-signed certificate 
# - Without this flag, accessing a site with a self-signed certificate will cause curl to raise an error
# - This flag will also cause curl to ignore other SSL errors, like an outdated certificate
skip_ssl_certificate_verification() {
    curl -k -u <user>:<password> https://localhost:8089/servicesNS/nobody/kvstoretutorial/storage/collections/config/mycollection/acl
}

send_get_request() {
    curl 'www.google.com'
}

# Send a POST request with no data to the url
send_empty_post_request() {
    curl -X POST -v http://127.0.0.1:5100/oneLineGridlab
}

# POST some data to the URL. A POST request is implicitly used
send_data_post_request() {
    curl -d "hello" http://127.0.0.1:5000
}

# POST a file to the server
# curl <url> -F "<form file name>=@<file name>;filename=<new file name>"
send_file_post_request() {
    curl -F mycoolfile=@app.py http://127.0.0.1:5000/file
}

# POST general form data to the server
# curl -F <key>=<value> <url>
send_form_data_post_request() {
    curl -F foo=bar -v http://127.0.0.1:5000/get-form-value
}

# POST form data (which happens to include files), then download the result
# $ curl -F <form file name>=@<file name> <url> -o <output file name>
send_file_download_file() {
    curl -F useLatLons=False -F glm=@test_ieee123nodeBetter.glm http://127.0.0.1:5100/oneLineGridlab -o no.png
    curl -F glm=@test_ieee123nodeBetter.glm http://127.0.0.1:5100/oneLineGridlab -o yes.png
}

# Operate in verbose mode. Shows request and response headers
verbose_mode() {
    curl -v
}

#send_get_request
#send_empty_post_request
send_form_data_post_request

# Problems
# - curl (26) couldn't open file
#    - "_" and file permissions usually aren't the issue. The issue was a hidden extension on the filename