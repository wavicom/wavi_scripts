### Full installation of WAVI. Masternode and Sentinel with WAVI Blockchain database.

This script is designed to speed up the process of wallet synchronization on VPS. Installing wavi masternode becomes easier and more enjoyable. This includes an algorithm to load the current blockchain database from http://explorer.wavicom.info. This solves the problem of long wallet synchronization.

Note: it is recommended to install root access before all actions. This can be done by command:

`sudo -i`

***Step 1:*** 

Download the script:

`wget -q https://raw.githubusercontent.com/wavicom/wavi_scripts/master/setup_wavi_mn_and_sentinel_with_bc_db.sh`

***Step 2:***

Give access to the script:

`chmod 755 setup_wavi_mn_and_sentinel_with_bc_db.sh`

***Step 3:***

Running the script:

`./setup_wavi_mn_and_sentinel_with_bc_db.sh`

The installation process can take 5 to 15 minutes, depending on your VPS configuration.

***Step 4:***

Edit your `masternode.conf` on the local wallet following the instructions in the terminal (here you will be shown your "masternode private key" - copy it). 

Note: To get txhash and txindex, you need to create a new address for masternode (File > Receiving addresses > New), send to it exactly 1000 WAVI, wait for 15 confirmations. Then go to the Debug Console (Tools > Debug Console). In the console window that comes up type "masternode outputs" without the quotes and press enter. This will output the transaction ID and the number (usually 0 or 1), which shows the transaction position in the block. This is "txhash" and "thindex" respectively.

***Step 5:***

Wait for the full synchronization on the VPS wallet. 
Command to monitor synchronization blocks:

`watch wavi/wavi-cli getinfo`

This will be updated every two seconds and you need to wait for the number of blocks to match the number of blocks in the blockchain. (The number of blocks in the blockchain can be found here http://explorer.wavicom.info/). Once it does exit the watch by typing ctrl-c.

Then you need to wait for the msdternodes list to sync. Command to monitor synchronization masternodes:

`watch wavi/wavi-cli mnsync status`

This will update every two seconds and you need to wait till this shows 999 under the assetID section. Once it does exit the watch by typing ctrl-c.

***Step 6:***

After complete synchronization of blocks and masternodes list run your local wallet and click in the tab "Masternodes" on the button "Start MISSING". After that, it should take some time before the status of WATCHDOG_EXPIRED will change to ENABLED. It usually takes around 1 hour. If after some time you see the status "ENABLED", then your masternode is successfully launched. Congratulations!
