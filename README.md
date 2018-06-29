## Scripts for automatically install WAVI Masternode and Sentinel.

These scripts are designed to facilitate the process of installing WAVI Masternode for Ubuntu 16.04. Be here:

- Instructions for full installation, including Masternode+Sentinel. 
- Installation instructions Sentinel only.

### Full installation of WAVI. Masternode and Sentinel.

***Step 1:*** 

Download the script:

`wget -q https://raw.githubusercontent.com/wavicom/wavi_scripts/master/setup_wavi_mn_and_sentinel.sh`

***Step 2:***

Give access to the script:

`chmod 755 setup_wavi_mn_and_sentinel.sh`

***Step 3:***

Running the script:

`./setup_wavi_mn_and_sentinel.sh`

The installation process can take 5 to 15 minutes, depending on your VPS configuration.

***Step 4:***

Follow the instructions in the terminal. Then wait for the full synchronization on the VPS wallet. After that, it should take some time before the status of WATCHDOG_EXPIRED will change to ENABLED. It usually takes 20-30 minutes.

### Installation of WAVI Sentinel.

***Step 1:*** 

Download the script:

`wget -q https://raw.githubusercontent.com/wavicom/wavi_scripts/master/setup_wavi_only_sentinel.sh`

***Step 2:***

Give access to the script:

`chmod 755 setup_wavi_only_sentinel.sh`

***Step 3:***

Running the script:

`./setup_wavi_only_sentinel.sh`

The installation process can take 1 to 5 minutes, depending on your VPS configuration.

***Step 4:***

Test the config by runnings all tests:

`cd sentinel && ./venv/bin/py.test ./test`

You should get: "23 tests passed". Congratulations! You have successfully installed WAVI.
