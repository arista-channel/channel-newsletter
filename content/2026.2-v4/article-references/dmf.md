# DANZ Monitoring Fabric: Wireshark Integration & the Combo Service Node

**✍️ Authors:** Brandon Mainock, Advisory Systems Engineer

## Overview

I've had plenty of mentors in my career tell me the best way to learn is to suffer through the hard/old way because you'll appreciate the new tools, it builds character, and you'll have options for solving problems. Credit where credit is due, they were right. The suffering did teach me a lot and I'm grateful for it. Of course, I still reflect when seeing the latest and greatest advancements come out on my past endeavors where a past Brandon is fighting for his life thinking "Wow, that would have been super helpful 2 years ago". Anyways this article follows a similar vein where we will talk about clunky long workflows to make centralization an easier method. All culminating into one of my favorite network observability tools Arista has to offer…DANZ Monitoring Fabric (DMF). In this article I'll cover the addition of a wireshark instance on the DMF controllers and the service nodes adding recording services, exploring how workflows become more efficient and greater functionality is more obtainable than ever.

## Key Technical Highlights

- **Wireshark on the controllers**: By no means is it new that DMF has a packet recorder node that can be integrated into a pure controller and switch deployment. The added feature set that you gain is the ability to query recorded packets via the recorder nodes dashboard in the DMF UI. These queries consist of
    - Window - Earliest and latest packet received on the recorder node
    - Size - Give the query parameters how much data are you expecting

    And of course…

    - Packet Data - This query type can be useful for creating pcaps given the parameters of your query.

![Wireshark embedded in the DMF Controller UI](../assets/originals/dmf-rId6.gif)

However, now the script is being flipped. Rather than querying the recorder node and exporting the pcap from the DMF UI on to a local machine that would have wireshark on it, what if wireshark was there on the DMF UI along with your pcaps!?

- **The Combo node** DMF has also had advanced packet processing capabilities for a while as well. Offering flexible offerings of bandwidth and service use cases such as 40Gb of deduplication or 10Gb interfaces of 4 different services. What's new in the latest releases is the addition of a new type of service node that now has a 32Tb drive for packet recording functionality. All in all you get a combination of advanced packet processing and packet recording capabilities all in the same appliance.

## Platform Specifications

### DMF Controllers — Appliance, VM, Public Cloud

**DMF Controllers**: Are the central pane for all things DMF. Since DMF is a controller based architecture the management of fabric switches and the service/recorder nodes are all configurable and interactable from the Controller UI.

### Service Node With Recording Action

**Service Nodes**: Much like ice cream services nodes have different flavors. Conveniently instead of the tough decision between macadamia nut vs lemon service nodes follow a linear scaling. From the lowest capacity 10Gbx4 to 25Gbx4 to finally the 100Gbx4. These devices can also be added to a DMF fabric in a very modular fashion IE pay as you grow. If more capacity is needed, simply purchase the service node amount you need and add it to the fabric. That being said, let's talk about the value of a service node and what exactly does "advanced packet processing" means.

We start with two terms:

- Actions: This is the comprehensive term for services that can be configured on an interface. Examples are AppID, Deduplication, or IPFIX record generation.
- Service Interface: These are the ports that are assigned the actions from above. Whether that is just one interface for a preferred service, or stacking multiple actions onto a single interface at the cost of some bandwidth.

![Configuring a Managed Service Action on a DMF service interface](../assets/originals/dmf-rId7.gif)

## Technical Benefits

### 1. Wireshark on DMF Controllers

- **Not watered down**: Mere moments after upgrading my DMF lab the first thing I checked was to see if the wireshark engineers have come to know and love had been put on guide rails with functionality limited to only viewing. I'm happy to report that everything from profiles and custom layout to the various windows required to view conversation have not been touched.
- **No more local device necessity**: One pain about creating and using pcaps on the recorder node prior to the wireshark integration was that to view the pcap you would have to export the pcap from the recorder node on a local machine to view it. This became an issue when the pcap in question was big, along with remote connectivity, creating long wait times for downloads. Of course all this working on the basis you had space on the machine you were exporting to to store the pcaps. With the addition of wireshark now the already created pcaps can be viewed without any exportation required. This cuts down on data usage for remote connectivity, storage and logistics of pcap storage and ultimately makes everything easier by finding all that uou need right on the controllers.

### 2. Service node with recording action

- **Huge win for smaller deployments**: One of the major values that DMF is known for is that it scales easily and cost effectively. Want more throughput? Add a switch or two. Want more packet recording? Add a recorder node or two. But let's flip the script and talk about the possibilities of the latter. What if you need a small deployment? If you wanted all the DMF functionality in a small deployment at minimum you'd have to have one switch (1RU), one controller (VM), a recorder node (2RU), and a service node (1RU). That's 4RU and a VM to get everything DMF has to offer for broad functionality. Now with the addition of the service node that can record we have one switch (1RU), 1 combo node (1RU) and a VM. That's 50% of the space savings to have the ability to do all features of years prior!
- **Work flows are easier than ever!**: With the addition of recording on the combo node being an action/service means that when creating policy data paths instead of adding a service to the policy and then adding a recorder node interface as a delivery, three parts in total. Now we can simply define our ingress ports and add services including the recording service. No delivery needed as the recording will terminate at the service node. In total now only two things to focus on when making policies for DMF!

## Resources

- DMF Service Node Breakdown: <a href="https://www.arista.com/en/hg-dmf/hg-dmf-dmf-service-nodes" target="_blank">DMF Service Nodes</a>
- DMF Product Page: <a href="https://www.arista.com/en/products/danz-monitoring-fabric" target="_blank">DANZ Monitoring Fabric</a>
- DMF Documentation: <a href="https://www.arista.com/en/support/toi/danz" target="_blank">DMF Technical Documentation</a>
