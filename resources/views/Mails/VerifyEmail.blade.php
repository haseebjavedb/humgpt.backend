<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verify Email</title>
</head>
<body>
    <div style="width: 50%;height: 100vh;margin: auto;background-image:url('http://127.0.0.1:8000/images/wave-bg.png');background-position:center;background-size:cover;border-radius:10px;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">        
        <div style="width: 100%;text-align:center">
            <img src="http://127.0.0.1:8000/images/logo2.png" style="height:100px;margin:20px auto" alt="EcomEmail.AI Logo">
        </div>
        <div style="width: 100%;text-align:center;">
            <h2 style="color: white;font-family:Arial">Thank you for registering with EComEmail.AI</h2>
            <p style="color: white;font-family:Arial; padding: 0 20px;">
                To ensure the security of your account and to complete your registration process, please enter the following One-Time Password (OTP) in the verification section on our platform:
            </p>
            <div style="background: #6db443; width: 200px;margin:0px auto;border-radius:10px;display: flex;height: 60px;justify-content: center;align-items: center;">
                <span style="font-size: 40px;font-weight: bold;color:white;font-family:Arial;">{{ $data['code'] }}</span>
            </div>
        </div>
        <div style="width: 95%; padding: 20px">
            <p style="color: white;font-family:Arial; font-weight:bold;font-size:14px">
                Please Note:
            </p>
            <p style="color: white;font-family:Arial;font-size:14px">
                This OTP is valid for 15 minutes only. If you don't verify within this time, you will need to request a new OTP.
                <br>
                <br>
                Never share your OTP with anyone, even if they claim to be from <a href="ecomemail.ai" style="color: white" target="_blank">EComEmail.AI</a>. We will never ask you for this code in any form of communication other than this verification email.
                <br>
                <br>
                If you did not initiate this request, please contact our support team immediately at <a style="color: white" href="mailto:support@ecomemail.ai">support@ecomemail.ai</a>
                <br>
                <br>
                Thank you for choosing <a href="ecomemail.ai" style="color: white" target="_blank">EComEmail.AI</a>. We're excited to have you on board!
                <br>
                <br>
                Warm Regards,
                <br>
                <br>
                The EComEmail.AI Team
            </p>
        </div>
    </div>
</body>
</html>