### 1️⃣ DANZ Monitoring Fabric: Wireshark Integration & the Combo Service Node

**✍️ Authors:** Brandon Mainock, Advisory Systems Engineer

![DMF Controller Overview Dashboard](../assets/dmf-controller-overview.gif)
*The DMF Controller Overview — a single pane showing Controller Health, Switch Health, Policy Health, Smart Node Health, top interfaces by traffic, and top policies*

**Overview**

The best way to appreciate a great tool is to have lived without it. DANZ Monitoring Fabric (DMF) has always been one of Arista's most powerful network observability platforms — but recent releases have made centralized packet capture workflows dramatically more efficient. This article covers two major additions: a full Wireshark instance embedded directly in the DMF Controller UI, and a new Combo Service Node that unifies advanced packet processing and packet recording in a single appliance. Together, these features eliminate steps, reduce dependencies on local machines, and make deep packet inspection more accessible than ever.

**Key Technical Highlights:**

- **Wireshark on DMF Controllers**: A full, unmodified Wireshark instance is now embedded in the DMF Controller UI — not watered down. Recorded pcaps can be viewed directly in-browser without exporting to a local machine, eliminating download delays and storage logistics.
- **Recorder Node Query Types**: The DMF UI supports three query types against recorder nodes — Window (earliest/latest packet received), Size (expected data volume), and Packet Data (pcap generation based on defined parameters).
- **The Combo Service Node**: A new service node variant combines advanced packet processing capabilities with a 32TB drive for packet recording — all in a single appliance. Replaces the need for separate recorder and service nodes in many deployments.
- **Modular, Pay-As-You-Grow Scaling**: Service nodes follow a linear capacity model (10Gbx4 → 25Gbx4 → 100Gbx4) and can be added to the DMF fabric incrementally as demand grows.

**Platform Specifications:**

**DMF Controllers — Appliance, VM, Public Cloud**
- **Role**: Central management plane for the entire DMF fabric — switches, service nodes, and recorder nodes are all configured and managed from the Controller UI
- **New Capability**: Full Wireshark instance now available directly in the Controller UI for in-browser pcap analysis
- **Deployment Options**: Physical appliance, virtual machine, or public cloud instance
- **Use Cases**: Centralized network observability, packet capture management, recorder node querying

**Service Node With Recording Action (Combo Node)**
- **Recording Capacity**: 32TB onboard storage for packet recording
- **Processing Capabilities**: Advanced packet processing (AppID, Deduplication, IPFIX record generation) combined with recording on a single device
- **Interface Options**: 10Gbx4, 25Gbx4, 100Gbx4 — linear scaling model
- **Deployment Model**: Modular, pay-as-you-grow — add nodes to the fabric as capacity needs increase
- **Use Cases**: Smaller deployments requiring both recording and processing without separate appliances; cost-effective unified observability

**Service Node Terminology:**
- **Actions**: Services configurable on an interface — examples include AppID, Deduplication, and IPFIX record generation
- **Service Interface**: Ports assigned one or more actions; multiple actions can be stacked on a single interface at the cost of some bandwidth

![Configure Managed Service Action](../assets/dmf-service-action-config.gif)
*The DMF UI for configuring a Managed Service Action on a service interface — select the action type (AppID, Deduplication, IPFIX, etc.) to apply to a given port*

---

**Technical Benefits:**

**1. Wireshark on DMF Controllers**

- **Not watered down**: The Wireshark instance integrated into the DMF UI is the full product — profiles, custom layouts, and conversation analysis windows are all intact. Engineers who know Wireshark will find everything they expect.
- **No more local device necessity**: Previously, viewing a pcap required exporting it from the recorder node to a local machine with Wireshark installed. For large pcaps or remote connections, this meant long download times and a dependency on having enough local storage. With Wireshark now embedded in the DMF Controller UI, pcaps can be opened and analyzed directly — no export required. This reduces data usage over remote connections, eliminates storage logistics, and consolidates the entire workflow in one place.

**2. Service Node with Recording Action (Combo Node)**

- **Huge win for smaller deployments**: One of DMF's core value propositions is that it scales easily and cost-effectively. The pay-as-you-grow model is truly... *[⚠️ INCOMPLETE IN SOURCE DOCUMENT — author input needed to complete this section]*
- **Workflow still works**: *[⚠️ INCOMPLETE IN SOURCE DOCUMENT — author input needed to complete this section]*

---

**Deployment Use Cases:**

**Distributed NOC / Remote Site Troubleshooting**
- **Challenge**: Remote network engineers need to analyze packet captures from sites they cannot physically access, but exporting large pcaps over WAN links is slow and consumes bandwidth
- **Solution**: Wireshark embedded in the DMF Controller UI allows engineers to open and analyze pcaps directly in the browser — no download required
- **Benefits**: Faster time-to-resolution, reduced WAN bandwidth consumption, no dependency on local machine storage capacity

**Mid-Market and Branch Deployments**
- **Challenge**: Smaller deployments need both advanced packet processing (deduplication, AppID, IPFIX) and packet recording, but deploying separate service nodes and recorder nodes adds cost and complexity
- **Solution**: The Combo Service Node delivers both capabilities in a single appliance with 32TB of recording storage
- **Benefits**: Reduced hardware footprint, simplified cabling and management, cost-effective entry into full-featured DMF functionality

**Scalable Security Operations**
- **Challenge**: Security teams need to capture and retain packet data at scale while also running real-time analytics — these functions previously required separate hardware
- **Solution**: Combo nodes handle both recording and processing in one unit; additional nodes can be added to the DMF fabric as traffic volumes grow
- **Benefits**: Linear, non-disruptive capacity expansion; unified management of recording and processing through the DMF Controller

---

**Partner Opportunities:**

- **Network Observability Refresh**: Position DMF upgrades to customers who rely on packet capture for security or troubleshooting — the Wireshark integration is a compelling, easy-to-demo improvement over legacy workflows
- **Consolidated Appliance Sales**: The Combo Node is a strong upsell for customers running separate service and recorder nodes, or a right-sized entry point for mid-market opportunities
- **Remote/Multi-Site Customers**: Customers with distributed teams or WAN-connected sites have an immediate pain point that the Wireshark-in-UI feature directly solves — use it to open the DMF conversation
- **Security-Focused Accounts**: Customers with SOC or incident response functions are natural targets for full DMF deployments; the Combo Node reduces the barrier to entry

**Resources:**

- DMF Product Page: <a href="https://www.arista.com/en/products/danz-monitoring-fabric" target="_blank">DANZ Monitoring Fabric</a>
- DMF Documentation: <a href="https://www.arista.com/en/support/toi/danz" target="_blank">DMF Technical Documentation</a>

---
