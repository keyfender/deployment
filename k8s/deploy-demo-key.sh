#!/bin/sh -ex

POST_DATA='{
    "purpose": "sign",
    "algorithm": "RSA",
    "id": "web_server",
    "privateKey": {
        "publicExponent": "AQAB",
        "primeP": "AOedR8mKUVN2jLE60cbESw-o88d2f19oyAjNLUtnLgYnBIKva10JYDRHa_EXqiStx-cDTNvd5xBVPXFrt56sdpHgW1rL9BkcXX5Z75eNQwCEZOxrHp7uSkefr3we7KCTEvFMnA8tp4tnA5y7J-anlgz5oucmS91JS8O8l_UGGk0Sx52N7aRjEVI8Rbm8Mz91jPPuHevvYy0uqkEwI2nxVTlNadmCrJi3DJ_xVm_8bUTCixBcs9LurDfUI70llz9XqHX_AfOOBc8giIAS8PUDa6djKMbKtKR2OurAdHLFMvUWEMEpUwjS-CyFkv-LtXCnl2J0KqKGDW5DYZOMuYSo71s=",
        "primeQ": "ANAOJHTHgQNr-VWf35WoVYKR6r3fZDy5mtfDlj3i0YRdU7PReanwesNcDiHc1a5nkmVUOpmzG9VmI6vWX2-VEAbW4nukqKsljrla1VZ7RtYsmeoat5vSKwiL1P2fDqjX8xKM1Q94z4wMoXjfuuRbimoOa9uuGpTfKEJolXF0Z6YFUdQWnosOY3GIOQNvVNGYwtczTj2ykVbF3rFepVOhMgvUPKEN0foXAI1yXQECf3nrEHZmNS1IX6m0pqKOdc9xrRZn6Je1E9CLkp52pCkPxWJ0Swep1uk8Lc5MnSo1NmnahVBra8rozvSEEh4p8GVDRsDivzfJYTMEuJS-8pUShCs="
    }
}'
kubectl run deploy-demo-key --image=busybox --restart=Never --attach --rm -- wget -q -O- --post-data "$POST_DATA" http://admin:secret@keyfender:8080/api/v0/keys
