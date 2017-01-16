<?php
#!/usr/bin/php
/**
 * PHP script may be overwrite on C or golang
 */
// Checking if today's file is downloaded and exists
if(!is_file(__DIR__.'/images/'.date('d-m-y').'.jpg'))
{
    // init curl
    $ch = curl_init();
    // Images will be download from yandex images (image of the day)
    curl_setopt($ch, CURLOPT_URL,"https://yandex.ua/images/today?size=1920x1200");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $server_output = curl_exec ($ch);
    $yandexData = curl_getinfo($ch);
    // close curl connection
    curl_close ($ch);
    // copy image from yandex server to local directory
    if(copy($yandexData['redirect_url'], __DIR__.'/images/'.date('d-m-y').'.jpg')) {
        // Logging
        echo date('d-m-Y H:i:s')." File success downloaded \r\n";
        $imageUrl = __DIR__.'/images/'.date('d-m-y').'.jpg';
        // Call bash script for update image using `gsettings`
        system('sh '.__DIR__.'/change.sh '.$imageUrl);
    }else{
        // Logging error
        echo date('d-m-Y H:i:s')." File download Failed \r\n";
    }
}
