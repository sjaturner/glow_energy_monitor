# Harvesting Electricity and Gas Consumption Measurements From Your Smart Meter

I'm unsure about the details, but there's a company called Hildebrand which
offers Energy Consultation Services and Smart Metering products. From
their website:

    Hildebrand are experts in the capture, storage, analysis and playback
    of energy consumption data

Some of their offerings include Smart Home products for energy consumption,
temperature sensing, etc.

    https://shop.glowmarkt.com/

They also appear to have access to Smart Meter data and provide a phone
app to access that, called Bright:

    https://play.google.com/store/apps/details?id=uk.co.hildebrand.brightionic&hl=en_GB&pli=1

I installed that app on my Android phone. It was fun for a while, but
not as much fun as data. Glowmarkt kindly supply a well thought out and
documented [1] API which is available via an access token, after you've made
an account using the Bright app. The key point here is to install the
app, create an account and _make sure you pay attention to the username
and password_

I think that there are sophisticated systems for integrating data from
this source into your your Smart Home Management Systems. My house is
probably a couple of hundred years old and isn't interested in that sort
of modern nonsense.

There's background here, I only needed step 1 _because Linux_.

    https://glowmarkt.com/home/blogs/extracting-energy-data-from-the-hildebrand-glowmarkt-api-in-5-easy-steps

I found an excellent resource on Github, with BASH scripts to drive the
API. I've reworked some of those to do a bit less: all I want is tab
separated epoch and energy consumption data, after all.

    https://github.com/glowenergydev/glow-bash.git

I copied the licence file from there.

## How to use this:

Make sure you have jq (https://jqlang.github.io/jq/) installed and in your 
path. On Debian, it's just this:

    sudo apt-get install jq

Clone this project and cd into the resulting directory.

Get your token for accessing the API. Apparently this token will last for 
months. I guess you may need to repeat this at some point:

    ./get_token.sh your_username_from_bright_app the_corresponding_password

That'll spit out some JSON but also create a file called token.json

Next, get the resources. This seems to be how the API identifies different 
services - I don't use web APIs much so it all seems like magic to me.

    ./get_resource.sh 

That gets the resources.json file which seems to list the services
and provides some unintelligible UUID-looking things for getting at them.

### Gas readings

This will retrieve your gas readings for the last couple of days, tab separated 
for your maximum convenience.

    :; ./recent.sh gas.consumption | head
    1721679600      3.56374363
    1721681400      1.76387181
    1721683200      6.74819268
    1721685000      4.39855408
    1721686800      3.65985182
    1721688600      0
    1721690400      0
    1721692200      0
    ...

### Electricity readings

See above, similarly:

    :; ./recent.sh electricity.consumption | head
    1721679600      0.235
    1721681400      0.123
    ...

## Observations

I find that the readings are somewhat behind - but eventually catch up.
I'm putting this down to either having very poor mobile coverage for the
Smart Meter backhaul in my location or perhaps Glowmart deciding not to
provide optimal real time data.

[1] https://docs.glowmarkt.com/GlowmarktApiDataRetrievalDocumentationIndividualUser.pdf
