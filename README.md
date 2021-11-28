# Oyster Card

This was a pairing challenge as part of Makers Academy week 2, completed over 5 days using pair programming in the driver navigator style. It aims to simulate an Oyster card, where you can top up your account, touch in and touch out at stations and have this logged in a journey history, and have a the cost deducted from your balance. Penalty fares are also calculated for invalid journeys e.g. touching in twice, or touching out without touching in first.

# User Stories

```
In order to use public transport
As a customer
I want money on my card ✓

In order to keep using public transport
As a customer
I want to add money to my card ✓

In order to protect my money
As a customer
I don't want to put too much money on my card ✓

In order to pay for my journey
As a customer
I need my fare deducted from my card ✓

In order to get through the barriers
As a customer
I need to touch in and out ✓

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey ✓

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete ✓

In order to pay for my journey
As a customer
I need to know where I've travelled from ✓

In order to know where I have been
As a customer
I want to see to all my previous trips ✓

In order to know how far I have travelled
As a customer
I want to know what zone a station is in ✓

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out ✓

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

# Using the app

## Setup

```
git clone https://github.com/ConorButler/oystercard.git
cd oystercard
bundle
rspec
```

## Setting up the Oyster card and Station objects

```
irb
require './lib/station'
require './lib/journeylog'
require './lib/journey'
require './lib/oystercard'
oyster = Oystercard.new
paddington = Station.new("Paddington", 1)
mile_end = Station.new("Mile End", 2)
```

## Going on a journey

```
oyster.top_up(50)
oyster.touch_in(mile_end)
oyster.touch_out(paddington)
```

## Example REPL output:

# Tests

![Tests](https://i.gyazo.com/cd14dd6341a908dbdaa114356cc7dee1.png)
