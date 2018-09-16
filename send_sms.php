<?php
require __DIR__ . '/vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account SID and Auth Token from twilio.com/console
$account_sid = 'ACd7bd438097782e4c79a158fb3500290e';
$auth_token = 'ed0c45f4d04589b5cf5f1f488beeeb08';
// In production, these should be environment variables. E.g.:
// $auth_token = $_ENV["TWILIO_ACCOUNT_SID"]

// A Twilio number you own with SMS capabilities
$twilio_number = "+447533011143";

$client = new Client($account_sid, $auth_token);
$client->messages->create(
    // Where to send a text message (your cell phone?)
    '+447746406608',
    array(
        'from' => $twilio_number,
        'body' => 'Thank you! Your order was placed and will be delivered before 18:52!'
    )
);
