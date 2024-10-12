# Harvesting Electricity and Gas Consumption Measurements From Your Smart Meter

I'm unsure about the details but there's a company called Hildebrand which
offers Energy Consultation Services and Smart Metering products. From
their website:

    Hildebrand are experts in the capture, storage, analysis and playback
    of energy consumption data

Some of their products include Smart Home products for energy consumption,
temperature sensing, etc.

    https://shop.glowmarkt.com/

They also appear to have access to Smart Meter data and provide a phone
app to access that called Bright:

    https://play.google.com/store/apps/details?id=uk.co.hildebrand.brightionic&hl=en_GB&pli=1

I installed that on my Android phone. It was fun for a bit, but not
as much fun as data. Glowmarkt kindly supply a well thought out and
documented API which is available via an access token, after you've made
an account using the Bright app. The key point here is to install the 
app, create an account and _make sure you pay attention to the username and password_

There's background here, I only needed step 1 _because Linux_.

    https://glowmarkt.com/home/blogs/extracting-energy-data-from-the-hildebrand-glowmarkt-api-in-5-easy-steps

I found an excellent resource here, with BASH scripts to drive the API. I've reworked some of 
those to do a bit less: all I want is tab separated epoch and energy consumption data.

    https://github.com/glowenergydev/glow-bash.git

I copied the licence file from there.
