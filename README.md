# 📑 Temp Mail API Documentation

Effortlessly manage temporary email accounts and messages with the Temp Mail API. This user-friendly and efficient solution is ideal for applications, websites, or new projects with temporary email services. 📧✨

<img src="images/iPhone.png" width="150" height="300"> <img src="images/Mac.png" width="300" height="300"> 


## 📝 How to Get Started?

Getting started is simple with the Temp Mail API:

**😎 API Base URL:** `https://free-tempmail-api.vercel.app/api/`

### 1. 📨 Get New Mail Account
- **Endpoint:** `/newmail`
- **Method:** GET
- **Description:** Create a new temporary email account.
- **Query Parameters:** None
- **Example Request:**
  ```
  GET /newmail
  ```
- **Example Response:**
  ```json
  {
    "success": true,
    "newmail": {
      "email": "susan119776@hldrive.com",
      "token": " your token hare "
    }
  }
  ```


### 2. 📩 Get All Mail
- **Endpoint:** `/mails`
- **Method:** GET
- **Description:** Retrieve all emails in the temporary mailbox.
- **Query Parameters:** None
- **Headers:** 
  - `mailtoken` (string, required): The authentication token for accessing the mailbox.
- **Example Request:**
  ```
  GET /mails
  Headers:
    mailtoken: your_token_here
  ```
- **Example Response:**
  ```json
  {
    "success": true,
    "mails": [{ get all mails here }]
  }
  ```


#


Begin your journey with the Temp Mail API today and experience the convenience of managing temporary email accounts effortlessly! 📧✨

## 🎉 Credits
We want to acknowledge and appreciate the hard work and creativity of our development team. They've made this API a reality. 🙌

- Lead Developer: [**Dev. Gaurav Jatt 👨‍💻**](https://github.com/devgauravjatt)
- The application programmer: [**0xfff0800 👨‍💻**](https://github.com/devgauravjatt)
#
