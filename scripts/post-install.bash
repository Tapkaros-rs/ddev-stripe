#!/usr/bin/env bash
#ddev-generated

if [ -f ./.env ]; then
    source ./.env
fi

if [ -z "$STRIPE_API_KEY" ]; then
    read -r -p "Enter the Stripe API  key:  " STRIPE_API_KEY
    read -r -p "Enter device name to be displayed in stripe dashboard:  " STRIPE_DEVICE_NAME
    if [ -z "$STRIPE_API_KEY" ]; then
        echo "Stripe API key is required"
        exit 1
    fi
fi

if [ -z "$WEBHOOK_SERVICE_NAME" ]; then
    read -r -p "Enter webhook service name:  " WEBHOOK_SERVICE_NAME
    if [ -z "$WEBHOOK_SERVICE_NAME" ]; then
        echo "Service name is required"
        exit 1
    fi
fi


if [ -z "$WEBHOOK_SERVICE_PORT" ]; then
    read -r -p "Enter webhook service port:  " WEBHOOK_SERVICE_PORT
    if [ -z "$WEBHOOK_SERVICE_PORT" ]; then
        echo "Service port is required"
        exit 1
    fi
fi

printf "STRIPE_API_KEY=${STRIPE_API_KEY}\nSTRIPE_DEVICE_NAME=${STRIPE_DEVICE_NAME}\nWEBHOOK_SERVICE_NAME=${WEBHOOK_SERVICE_NAME}\nWEBHOOK_SERVICE_PORT=${WEBHOOK_SERVICE_PORT}" > .env

