# Set up ClashVPN on Your Kali Linux
In places like China, getting to sites like YouTube, Google, or LinkedIn often needs a VPN. Sometimes, it's just about connecting to your company's network. Here, I've got the tips you need to set up ClashVPN on your Kali Linux machine. Easy access, secure browsing!

## Download 
From [here](https://archive.org/download/clash_for_windows_pkg), download relevant file according to your operating system.

## Run Clash
I downloaded "Clash for Windows-0.20.39-x64-linux" to my downloads folder. 
After unzipping, locate **cfw** file inside or it and run it with command: **./cfw** to open clash. 

![image](https://github.com/jadu101/clash-on-kali/assets/76433661/dfdc09a8-b2e2-4b42-b894-2645a107bd5a)

## Import Clash Config
- Go to Profiles
  
![image](https://github.com/jadu101/clash-on-kali/assets/76433661/ed2e0b3f-a453-45a4-b6da-29b04a577dd4)

<br />

- Paste in your VPN address and click download.
  
![image](https://github.com/jadu101/clash-on-kali/assets/76433661/616cd2d8-e950-4c12-9208-dd46069b64ea)

<br />

- Now you have VPN connection.


## Configure System Proxy
1. Edit environment variables
```bash
$ sudo nano /etc/environment
```
Add the following three lines at the end of the file:
```bash
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export no_proxy="localhost, 127.0.0.1"
```
2. Enable proxy for sudo operations
```bash
$ sudo visudo
```
Add the following line to the file:
```bash
Defaults    env_keep+="http_proxy https_proxy no_proxy"
```
3. Reboot your machine to take effect

Congrats, now you have ClashVPN set up on your Linux Machine
