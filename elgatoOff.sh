curl -X PUT http://192.168.68.113:9123/elgato/lights -H "Content-Type: application/json" --data-binary @- <<DATA
{
"lights": [
        {
            "on": 0
        }
   ]
}
DATA
 
