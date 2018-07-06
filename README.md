## Scripts for automatically install WAVI Masternode and Sentinel.

These scripts are designed to facilitate the process of installing WAVI Masternode for Ubuntu 16.04. Be here:

- Instructions for full installation, including Masternode+Sentinel. 
- Installation instructions Sentinel only.
- [Masternode+Sentinel+blockchain database](MN_and_sentinel_with_bc_db.md). This solves the problem of long wallet synchronization.

Note: it is recommended to install root access before all actions. This can be done by command:

`sudo -i`

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

Edit your `masternode.conf` on the local wallet following the instructions in the terminal (here you will be shown your "masternode private key" - copy it). 

Note: To get txhash and txindex, you need to create a new address for masternode (File > Receiving addresses > New), send to it exactly 1000 WAVI, wait for 6 confirmations. Then go to the Debug Console (Tools > Debug Console). In the console window that comes up type "masternode outputs" without the quotes and press enter. This will output the transaction ID and the number (usually 0 or 1), which shows the transaction position in the block. This is "txhash" and "thindex" respectively.

***Step 5:***

Wait for the full synchronization on the VPS wallet. 
Command to monitor synchronization blocks:

`watch wavi/wavi-cli getinfo`

This will be updated every two seconds and you need to wait for the number of blocks to match the number of blocks in the blockchain. (The number of blocks in the blockchain can be found here http://explorer.wavicom.info/). Once it does exit the watch by typing ctrl-c.

Note: the full synchronization from zero on the VPS wallet takes longer than usual. First, the header synchronization occurs, which can take about 40 minutes, and only then the block synchronization begins. If you don't want to wait, you can upload an already synchronized blockchain database to the VPS.

Then you need to wait for the msdternodes list to sync. Command to monitor synchronization masternodes:

`watch wavi/wavi-cli mnsync status`

This will update every two seconds and you need to wait till this shows 999 under the assetID section. Once it does exit the watch by typing ctrl-c.

***Step 6:***

After complete synchronization of blocks and masternodes list run your local wallet and click in the tab "Masternodes" on the button "Start MISSING". After that, it should take some time before the status of WATCHDOG_EXPIRED will change to ENABLED. It usually takes around 1 hour. If after some time you see the status "ENABLED", then your masternode is successfully launched. Congratulations!!

### Installation of WAVI Sentinel only.

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
