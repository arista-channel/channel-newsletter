# The Many Facets of AI Fabrics

**✍️ Recognition:** Re-imagined for partners from the original authors' blog

![AI Fabrics — abstract network visualization](../assets/ai-fabrics-hero.gif)

*As we enter the generative AI era, the network has become the elastic backplane of AI infrastructure — the fabric that defines the efficiency of AI itself*

## Overview

As computational resources scale to meet the demands of large generative AI models, networking plays a crucial role in improving the utilization of precious cycles from accelerator processing units (XPUs). The network has become the governor of AI performance — every stalled packet, every microsecond of congestion, translates directly to loss of revenue. Conversely, well-optimized networks unlock latent AI performance across distributed XPU systems. In a world of trillion-parameter models and real-time inference, the efficiency of the network defines the efficiency of AI itself. This article reviews the three key network strategies used to connect and scale AI accelerators — **Scale-Up**, **Scale-Out**, and **Scale-Across** — and how Arista unifies them into a single AI Fabric.

## Key Technical Highlights

- **Scale-Up (Intra-Rack)**: Non-blocking, low-latency interconnect of XPUs within a single rack for shared memory coherency — enabled by liquid cooling for density and co-packaged copper/optics (CPC/CPO), with Ethernet Scale-Up Networking (ESUN) on a 200G SerDes foundation as an open alternative to proprietary interconnects.
- **Scale-Out (Inter-Rack)**: Horizontal scaling across racks in a flat two-tier leaf-spine fabric; massive radix maximizes reachable XPUs while preserving bisection bandwidth, with topology-aware Cluster Load Balancing (CLB) replacing static routing.
- **Scale-Across (Inter-Site)**: Interconnects physically separated AI clusters over distance via integrated internet, storage, WAN, and optical layers — using hierarchical deep buffers and SRv6 micro-segment (uSID) routing to absorb transient congestion and micro-bursts.
- **AI Etherlink™ Platforms**: Optimize the Multipath Reliable Connection (MRC) protocol via hardware-accelerated packet trimming and intelligent buffering to minimize tail latency.
- **Multi-Planar Orchestration**: Isolates traffic across independent fabric planes for deterministic performance and increased resiliency.
- **7800 AI Spine**: A high-radix spine layer for metro-mesh topologies, offloading inter-cluster traffic and leveraging SRv6 for stateless, end-to-end routing across geographically dispersed sites.

![Arista AI Fabrics — Front End Leaf Spine and Back End Scale-Up / Scale-Out / Scale-Across](../assets/ai-fabrics-networking-diagram.jpg)
*Networking for the AI Center: a Front End Leaf Spine connects CPUs, storage, and users, while the Back End AI Fabrics scale up (intra-rack, ~1k XPUs), out (inter-rack, ~100k XPUs), and across (inter-site, >1M XPUs)*

## The Three AI Fabric Strategies

### 1. Scale-Up — High-Speed XPU Interconnect, Intra-Rack

Vertical XPU scaling interconnects multiple compute nodes within a single rack using non-blocking, low-latency switches to achieve shared memory coherency. Workloads distributed across multiple XPUs in the same rack can access unified memory as a single giant pool, coordinating via non-blocking all-to-all communications. The advantage is simplicity — localized computation and high computational density. Modern designs improve XPU density through liquid cooling (reducing heat and power) complemented by low-power, high-bandwidth interconnects like co-packaged copper/optics. This close-knit integration means a single interconnect link failure or memory error can stall the whole node, requiring appropriate collective controls within the scale-up fabric.

### 2. Scale-Out — High-Speed XPU Interconnect, Inter-Rack

Scale-out (horizontal) scaling adds more machines, moving workloads across multiple servers or nodes and connecting storage, general-purpose CPUs, and WAN. These dual-mode systems traverse both east-west and north-south patterns, making them ideal for distributed training and inference parallelized across nodes. Scale-out efficiency is driven by network topology economics: by leveraging massive radix, operators maximize the number of XPUs reachable in a flat two-tier leaf-spine network — maintaining bisection bandwidth without the penalty of an extra tier of transceivers and fiber in power-conscious AI centers.

### 3. Scale-Across — AI Performance Across Distance and Locations

Scale-across expands across multiple datacenters by interconnecting physically separated AI clusters or pods over large distances, letting training jobs span a massive number of XPUs and pooling geographically distributed resources for frontier models. This requires robust infrastructure integrating internet, storage, WAN, and optical layers through complex routing and hierarchical deep buffers to absorb the transient congestion and micro-bursts inherent in distributed AI workloads. Advanced traffic engineering, robust encryption, and sophisticated routing keep AI compute clusters resilient and secure across multiple tenants.

## The Next Frontier — Unified AI Fabrics

With the relentless growth of AI workloads, the industry is moving beyond isolated, single-purpose networks toward unified AI fabrics that transform classic leaf-spine architectures into intelligent, multi-fabric systems synchronizing scale-up, scale-out, and scale-across. This paradigm converges the deterministic, RDMA-driven performance required for scale-out clusters with the metro-scale traffic steering needed for distributed deployments. By harmonizing hardware and software networking, customers get the economic simplicity of a two-tier design while scaling from thousands to millions of AI accelerators. The optimization of the MRC protocol — combined with SRv6 uSID support in EOS® — minimizes tail latency and enables fine-grained, source-routed steering, while multi-planar orchestration isolates traffic across independent fabric planes.

## One Consistent, Resilient Architecture

More than a decade ago, Arista pioneered the Universal leaf-spine (CLOS) architecture to replace rigid, oversubscribed three-tier data center networks. Traffic patterns have since shifted from strictly east-west to massive, synchronized all-to-all and all-reduce bursts for AI training and inference, while bandwidth demands explode from 112G SerDes to 224G and soon 448G per lane. Modern AI centers must simultaneously cope with the synchronous elephant flows of massive training and the low-latency, concurrent swarms of real-time inference — conditions where static topologies suffer hotspot jitter that slows Job Completion Time (JCT) or increases Time to First Token (TTFT). Adaptive AI fabrics across L1/L2/L3, implemented as multi-planar designs, overcome these slowdowns and deliver one consistent, resilient architecture for the age of agentic AI.

## Partner Opportunities

- **AI/ML Infrastructure Buildouts**: Position the Etherlink portfolio and 7800 AI Spine for customers standing up GPU/XPU clusters — the Scale-Up/Out/Across framework is a clear, consultative way to map customer scale to architecture.
- **Open Ethernet vs. Proprietary Fabrics**: ESUN and standards-based Ethernet are a strong differentiator for accounts wary of proprietary scale-up interconnects.
- **Multi-Site / Metro AI**: Scale-Across with SRv6 uSID addresses customers distributing training across datacenters — a high-value WAN/optical + datacenter conversation.
- **Performance Optimization**: Lead with the business case — reduced JCT and TTFT directly translate to better XPU utilization and ROI on expensive accelerators.

## Resources

- Source: <a href="https://blogs.arista.com/blog/the-many-facets-of-ai-fabrics" target="_blank">"The Many Facets of AI Fabrics" — Arista Blog</a> (Jayshree Ullal and Hardev Singh, May 2026)
- Arista AI Networking Solutions: <a href="https://www.arista.com/en/solutions/ai-networking" target="_blank">arista.com/en/solutions/ai-networking</a>
