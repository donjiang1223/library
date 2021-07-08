#/bin/bash

uploadToGoogleCloudStorage()
{

###判定檔案與上傳gcs

	[ -f  $1/$2 ] && {

        	sendSlackMessage "開始上傳 $(cd $1 && ls $2)"
        	gsutil cp -r $1/$2 gs://$3/

	}||{

        	sendSlackMessage "$4 上傳檔案不存在，請檢查。"
        	exit

	}

	sleep 10

###檢測檔案

	gsutil -q stat gs://$3/$2
	[ $? -eq 0 ] && {

	        sendSlackMessage "上傳成功,開始比對檔案大小。"
	        LOCAL_BYTES=$(ls -al $1/$2 |awk '{print $5}')
	        GCS_BYTES=$(gsutil ls -L gs://$3/$2 | grep "bytes" | awk '{print $4}')

	        sleep 5

	        if [ $LOCAL_BYTES -eq  $GCS_BYTES ];then

	                sendSlackMessage "大小符合，刪除本地檔案。"
	                rm -rf $1/$2

	        else

	                sendSlackMessage "$4 大小不符，請人工檢查。"

	        fi

	}||{

	        sendSlackMessage "$4 上傳失敗，請人工檢查。"

	}

}