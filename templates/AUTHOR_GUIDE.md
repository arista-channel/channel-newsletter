# Author Guide: Writing Technical Content for Engineers' Exchange

This guide helps authors create high-quality technical articles for the newsletter.

---

## Quick Start

1. **Copy the blank template**: `templates/blank-technical-article.md`
2. **Fill in your content** following the structure
3. **Review against the checklist** at the bottom
4. **Submit for review** to the newsletter team

---

## Template Sections Explained

### 1. Article Header

```markdown
### 3️⃣ Industrial-Grade Ruggedized Switching: Cognitive Campus for the Edge

**✍️ Authors:** Bill Dyrek, System Engineers Manager / Miguel Balagot, Tech Lead
```

- **Number**: Use 1️⃣, 2️⃣, 3️⃣ based on article position in newsletter
- **Title**: Clear, descriptive, technical but accessible
- **Subtitle**: Adds context or value proposition
- **Authors**: Full name and title, separate multiple authors with " / "

### 2. Overview (2-3 sentences, ~50-75 words)

**Purpose**: Hook the reader and establish relevance

**Answer these questions:**
- What is this technology/solution?
- Why does it matter?
- Who should care about it?

**Example:**
```markdown
**Overview**
Arista's new ruggedized switching platforms bring the power, reliability, and operational 
simplicity of Arista EOS to demanding industrial and outdoor environments. The 710HXP Series 
extends Cognitive Campus capabilities to harsh environments across manufacturing, transportation, 
utilities, and outdoor deployments.
```

**Tips:**
- Lead with business value, not just technical specs
- Avoid jargon in the first sentence
- Make it scannable - readers decide in 10 seconds if they'll continue

### 3. Key Technical Highlights (3-5 bullets)

**Purpose**: Quick wins - what makes this technology special?

**Format:**
```markdown
- **Bold Title**: Brief description of capability
```

**Example:**
```markdown
- **Extreme Environment Resilience**: IP50 Din Rail and IP30 1RU form factors engineered for harsh conditions
- **High-Power PoE**: 90W per port supporting next-generation Wi-Fi 7 access points
```

**Tips:**
- Focus on differentiators and unique capabilities
- Keep each bullet to one line if possible
- Use specific numbers and metrics

### 4. Platform Specifications (Optional)

**When to use**: When covering specific hardware/software products

**Format:**
```markdown
**[Product Name] ([Form Factor/Variant])**
- **[Category]**: [Specific details]
- **Use Cases**: [Primary applications]
```

**Example:**
```markdown
**710HXP-28TXH (Din Rail Switch - IP50 Rating)**
- **Form Factor**: Compact Din Rail mount for industrial control cabinets
- **Port Configuration**: 20 multi-gig ports (1G/2.5G/5G/10G) + 8 uplink ports
- **PoE Capability**: 90W high-power PoE++ for demanding devices
- **Environmental**: IP50 rating, extreme temperature range (-40°C to +75°C)
- **Use Cases**: Factory automation, industrial IoT, transportation hubs
```

**Tips:**
- Include 2-3 product variants if applicable
- Always end with "Use Cases" to show practical applications
- Keep specs relevant - don't list everything, just what matters

### 5. Technical Benefits (3-5 categories, 3-4 sub-benefits each)

**Purpose**: Deep dive into why this technology matters

**Format:**
```markdown
**1. [Benefit Category]**
- **[Sub-benefit Title]**: [Technical detail and business value]
```

**Example:**
```markdown
**1. Unified Operations with EOS**
- **Single OS**: Same Arista EOS across all network domains eliminates operational silos
- **CloudVision Integration**: Centralized management, telemetry, and automation for industrial edge
- **Zero Touch Provisioning**: Automated deployment and configuration for remote sites
```

**Tips:**
- Group related benefits into logical categories
- Balance technical depth with business value
- Use bold formatting for sub-benefit titles
- Each sub-benefit should be 1-2 sentences

### 6. Deployment Use Cases (4-6 scenarios)

**Purpose**: Show real-world applications and ROI

**Format:**
```markdown
**[Use Case Title]**
- **Challenge**: [Customer pain point]
- **Solution**: [How technology solves it]
- **Benefits**: [Quantifiable outcomes]
```

**Example:**
```markdown
**Manufacturing & Industrial Automation**
- **Challenge**: Factory floors require switches that withstand extreme temperatures, 
  vibrations, and electromagnetic interference
- **Solution**: 710HXP-28TXH Din Rail switches in control cabinets connecting PLCs, 
  robots, and sensors
- **Benefits**: Unified EOS platform bridges OT/IT networks, CloudVision provides 
  real-time visibility into industrial IoT
```

**Tips:**
- Make challenges relatable to customer pain points
- Be specific about the solution (product, deployment, configuration)
- Quantify benefits where possible (cost savings, time reduction, performance gains)
- Cover diverse verticals/industries

### 7. Partner Opportunities (3-5 bullets)

**Purpose**: Help channel partners identify revenue opportunities

**Format:**
```markdown
- **[Opportunity Type]**: [Description of business opportunity]
```

**Example:**
```markdown
- **Industrial IoT Projects**: Expand into manufacturing, energy, and transportation verticals
- **Campus Modernization**: Extend Cognitive Campus to outdoor areas, parking, and remote buildings
- **Smart City Initiatives**: Municipal Wi-Fi, traffic management, and public safety networks
```

**Tips:**
- Focus on revenue potential and market expansion
- Tie to partner capabilities and existing customer base
- Be specific about the opportunity (vertical, project type, customer segment)

### 8. Resources (3-5 links)

**Purpose**: Provide next steps for readers who want to learn more

**Format:**
```markdown
- [Description]: <a href="[URL]" target="_blank">[Link Text]</a>
- [Description]: [Coming Soon]
```

**Example:**
```markdown
- Product data sheet: <a href="https://www.arista.com/en/products/710hxp-series" target="_blank">710HXP Series Product Page</a>
- Industrial deployment guide: [Coming Soon]
```

**Tips:**
- Always use `target="_blank"` for external links
- Prioritize: Product pages, datasheets, white papers, deployment guides
- Mark future resources as "[Coming Soon]"
- Test all links before submitting

---

## Writing Style Guide

### Voice and Tone

- **Technical but Accessible**: Write for engineers who may not be domain experts
- **Action-Oriented**: Focus on what customers can do with the technology
- **Specific**: Use concrete examples, numbers, and specifications
- **Professional**: Avoid marketing hype, let the technology speak for itself

### Formatting Standards

- **Bold**: Use for emphasis on key terms, titles, and important concepts
- **Code**: Use backticks for technical commands, APIs, protocols (e.g., `802.1X`, `CloudVision API`)
- **Numbers**: Use specific metrics (90W, -40°C to +75°C, 1G/2.5G/5G/10G)
- **Emojis**: Only use numbered emojis (1️⃣, 2️⃣, 3️⃣) and ✍️ for author attribution

### Content Length Guidelines

- **Total Article**: 800-1200 words
- **Overview**: 50-75 words (2-3 sentences)
- **Each Use Case**: 40-60 words
- **Each Technical Benefit**: 30-50 words per sub-benefit

---

## Quality Checklist

Before submitting your article, verify:

### Content
- [ ] Overview is concise and compelling (2-3 sentences)
- [ ] All technical claims are accurate and verified
- [ ] Use cases are realistic and relatable
- [ ] Partner opportunities are specific and actionable
- [ ] Business value is clearly articulated alongside technical details

### Formatting
- [ ] Author attribution is complete and accurate
- [ ] All section headers follow the template structure
- [ ] Bold formatting is used consistently
- [ ] Numbered emojis are used correctly (1️⃣, 2️⃣, 3️⃣)
- [ ] Spacing is consistent (blank line before/after major sections)

### Links and Resources
- [ ] All links are tested and working
- [ ] External links use `target="_blank"`
- [ ] Future resources are marked "[Coming Soon]"
- [ ] At least 3 resources are provided

### Length and Readability
- [ ] Article is 800-1200 words
- [ ] Content is scannable (good use of bullets, bold, headers)
- [ ] Technical depth is appropriate for the audience
- [ ] No jargon without explanation

---

## Common Mistakes to Avoid

1. **Too Much Marketing Speak**: Let the technology speak for itself
2. **Missing Business Value**: Don't just list features, explain why they matter
3. **Vague Use Cases**: Be specific about customer challenges and solutions
4. **Broken Links**: Always test links before submitting
5. **Inconsistent Formatting**: Follow the template structure exactly
6. **Too Technical**: Remember the audience is engineers, but not necessarily domain experts
7. **Too Long**: Keep to 800-1200 words - be concise

---

## Need Help?

Contact the newsletter team:
- **Email**: cse-newsletter@arista.com
- **Code Owner**: @mbalagot12

---

## Template Files

- **Full Template with Instructions**: `templates/technical-content-template.md`
- **Blank Template**: `templates/blank-technical-article.md`
- **This Guide**: `templates/AUTHOR_GUIDE.md`

