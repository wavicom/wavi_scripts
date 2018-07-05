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

You should get: "23 tests passed". Congratulations! You have successfully installed WAVI Sentinel. Now wait for some time when the status of WATCHDOG_EXPIRED will change to ENABLED.
