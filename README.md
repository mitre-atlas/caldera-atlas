### CALDERA-ATLAS

This repository brings together several projects to enable adversary emulation and red-teaming of machine learning (ML) systems. It configures the MITRE CALDERA&trade; docker image with MITRE ATLAS&trade; plugins and provides sample ML services and environments for testing.

[CALDERA](https://caldera.mitre.org/) is a cyber security platform designed to easily automate adversary emulation, assist manual red-teams, and automate incident response.

[MITRE ATLAS](https://atlas.mitre.org/) (The Adversarial Threat Landscape for AI Systems) is a knowledge base of adversary tactics, techniques, and procedures targeting ML systems.

Included ATLAS CALDERA Plugins:
- [Almanac](https://github.com/mitre-atlas/arsenal): Adds the [ATLAS Navigator](https://mitre-atlas.github.io/atlas-navigator/) to CALDERA
- [Arsenal](https://github.com/mitre-atlas/arsenal): Implements ATLAS techniques as CALDERA Abilities and provides sample CALDERA Adversaries that target ML systems

[ML-Vulhub](https://github.com/mitre-atlas/ml-vulhub) is a collection of of scripts for intantiating ML-related services and modeling ML environments


### Use:

1. Build the CALDERA docker image:
```bash
docker-compose build
```

2. Run the CALDERA docker image with ATLAS plugins plugins (`almanac` and `arsenal`):
```bash
docker-compose up
```

3. Access the CALDERA interface at [localhost](https://localhost:8888).

4. See [ML-Vulhub](https://github.com/mitre-atlas/ml-vulhub) for sample environments to test.
