[![Docker Stars](https://img.shields.io/docker/stars/nickartman/homebridge-smartthings.svg)](https://hub.docker.com/r/nickartman/homebridge-smartthings/)
[![Docker Pulls](https://img.shields.io/docker/pulls/nickartman/homebridge-smartthings.svg)](https://hub.docker.com/r/nickartman/homebridge-smartthings/)
[![GitHub forks](https://img.shields.io/github/forks/AddoSolutions/homebridge-smartthings.svg?style=social&label=Fork)](https://github.com/AddoSolutions/homebridge-smartthings)
# Homebridge SmartThings on Docker


1. **Before this will be useful** you will need to read and follow the steps in the below article.  Be sure to place the config.json file in `my-docker-directory/config/config.json`.  You only need to do the `SmartThings API installation` and `config.json` example part.

[Setup Homebridge Smartthings](https://www.npmjs.com/package/homebridge-smartthings#smartthings-api-installation)

Once you have that, the rest is cheesecake.

2. Let's make this really simple, and use a docker-compose file.  Place this in `docker-compose.yml` inside of your `my-docker-directory` folder.

```yml
main:
  image: nickartman/homebridge-smartthings
  # build: ./ # Use this if you want to clone my repo and do your own thing
  restart: always
  cap_add:
    - NET_ADMIN
  ports:
    - "51826:51826"
  volumes:
    - ./config:/root/.homebridge
  net: "host"
```


3. Now, you simply need to run: `docker-compose up -d` while inside that directory and you are off to the races!  You will see the device appear on your homekit network and you can now do the happy dance

### Example Config


Here is what my config looks like (modified to preserve security of course):

```json
{
    "description": "JSON API",
    "platforms": [
        {
            "platform": "SmartThings",
            "name": "SmartThings",
            "app_url": "https://graph.api.smartthings.com:443/api/smartapps/installations/",
            "app_id": "0000000-0000-0000-0000-00000000000",
            "access_token": "0000000-0000-0000-0000-00000000000"
        }

    ],
    "bridge": {
        "name": "Homebridge",
        "username": "AA:BB:CC:DD:EE:FF",
        "port": 51826,
        "pin": "000-00-000"
    }

}
```

You will get that right out of the SmartThings tutorial I posted above.  Don't even try to come up with that yourself!

### Enabled Plugins


* homebridge-philipshue
* homebridge-ninjablock-temperature
* homebridge-ninjablock-humidity
* homebridge-ninjablock-alarmstatedevice
* homebridge-luxtronik2
* homebridge-mqttswitch
* homebridge-edomoticz
* homebridge-synology
* homebridge-smartthings
* homebridge-tesla
