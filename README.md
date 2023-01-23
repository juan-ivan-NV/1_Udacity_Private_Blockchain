# Private Blockchain App

Create a test application that allows the user to register stars, and track the ownership of each.

## What steps are needed to implement this application?

1.- The application will create a Genesis Block when we run the application.

2.- The user will request the application to send a message to be signed using a Wallet and in this way verify the ownership over the wallet address. The message format will be:

<code><WALLET_ADRESS>:${new Date().getTime().toString().slice(0,-3)}:starRegistry</code>

3.- Once the user has the message they can use a Wallet (Electrum or Bitcoin Core for example) to sign the message.

4.- The user will try to submit the Star object for that. The submission will consist of: <code>wallet address</code>, <code>message</code>, <code>signature</code> and the <code>star</code> object with the star information. The Start information will be formed in this format:

<pre>
<code>
     "star": {
         "dec": "68° 52' 56.9",
         "ra": "16h 29m 1.0s",
         "story": "Testing the story 4"
     }
</code>
</pre>

5.- The application will verify if the time elapsed from the request ownership (the time is contained in the message) and the time when you submit the star is less than 5 minutes.

6.- If everything is okay the star information will be stored in the block and added to the chain encoding the Star information.

7.- The application will allow us to retrieve the Star objects belong to an owner (wallet address). This information should be human readable so it shouldn't be encoded.


# How to use it?

## Run the app in docker

Download the repo and type ...

Build the image <code>docker build -t boilerplatex . </code>
Run the image and app <code>docker run -p 8000:8000 boilerplatex </code>
List the running containers<code>docker ps </code>
Stop the container<code>docker stop **(first 2 container name characters) </code>

Once the app is running ...

## Test the app 

Download and install Postman

### 1.- Make sure the app is working fine and it creates the Genesis Block.

GET <code>localhost:8000/block/0</code>

### 2.- Make the first request of ownership sending your wallet address.

POST <code>localhost:8000/requestValidation</code>

Body settings: raw, JSON

### 3.- Sign the message with your Wallet. 

* You can use Bitcoin Testnet app.

* If you get issues you can also try to sign a message on this <a href = "https://reinproject.org/bitcoin-signature-tool/#sign">link.</a>

### 4.- Submit your Star.

POST <code>localhost:8000/submitstar</code>

Body settings: raw, JSON

<pre>
<code>
     {
    "address":"1HZwkjkeaoZxxxxxxxxxxkxp45agDiEzN",
    "signature":"HFxxxxxjQKc//wKvBxxxxxxxxxxx7Fyu2lQzgEAvP4sJxxxxxxxxxxCHww263/LFgCMfA4A********eI45u6M=",
    "message":"1Hxxxxxkjkeaoxxxxxxxp45agxxxxzN:1659920690:starRegistry",
    "star":{
            "dec": "68° 52` 56.9",
            "ra": "16h 29m 1.0s",
            "story": "Tsting the story 2"
    }
}
</code>
</pre>

### Optional.- Retrieve Stars owned by me.

GET <code>localhost:8000/blocks/1HxxxxxkeaoZ*****************EzN</code>

### Optional.- Retrieve a star by it's hash.

GET <code>localhost:8000/block/hash/48************************************db779f73bcc3357faa</code>

2. To make sure your application is working fine and it creates the Genesis Block you can use POSTMAN to request the Genesis block:
    ![Request: http://localhost:8000/block/0 ](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/April/5ca360cc_request-genesis/request-genesis.png)
3. Make your first request of ownership sending your wallet address:
    ![Request: http://localhost:8000/requestValidation ](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/April/5ca36182_request-ownership/request-ownership.png)
4. Sign the message with your Wallet:
    ![Use the Wallet to sign a message](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/April/5ca36182_request-ownership/request-ownership.png)
5. Submit your Star
     ![Request: http://localhost:8000/submitstar](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/April/5ca365d3_signing-message/signing-message.png)
6. Retrieve Stars owned by me
    ![Request: http://localhost:8000/blocks/<WALLET_ADDRESS>](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/April/5ca362b9_retrieve-stars/retrieve-stars.png)