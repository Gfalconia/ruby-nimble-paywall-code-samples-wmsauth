def fileToken
  initial_url = "http://yourdomain.com:8081/vod/sample.mp4/playlist.m3u8"
  time = Time.now.gmtime()
  today = time.strftime("%m/%d/%Y %I:%M:%S %p")
  ip = request.remote_ip
  key = "password"
  validminutes = "20"
  base64hash = Base64.strict_encode64(Digest::MD5.digest(ip + key + today + validminutes))
  urlsignature = "server_time=" + today + "&hash_value=" + base64hash + "&validminutes=" + validminutes
  base64urlsignature = Base64.strict_encode64(urlsignature)
  signedurlwithvalidinterval = initial_url + "?wmsAuthSign=" + base64urlsignature
end
