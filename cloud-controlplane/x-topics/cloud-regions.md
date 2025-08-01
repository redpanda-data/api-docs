# Cloud Regions and Tiers

Usage tiers define the sizing of a cluster and provide tested and guaranteed workload configurations for throughput, logical partitions, and connections. Availability depends on the region and the cluster type (BYOC, Dedicated). See [BYOC tiers](https://docs.redpanda.com/redpanda-cloud/reference/tiers/byoc-tiers/) and [Dedicated tiers](https://docs.redpanda.com/redpanda-cloud/reference/tiers/dedicated-tiers/) for further details.

<h3>GCP</h3><table><tr><th>Region</th><th>Zones</th><th>Throughput Tiers</th></tr><tr><td>europe-west9</td><td>europe-west9-a,europe-west9-b,europe-west9-c</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>europe-southwest1</td><td>europe-southwest1-a,europe-southwest1-b,europe-southwest1-c</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>southamerica-west1</td><td>southamerica-west1-b</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>asia-east1</td><td>asia-east1-a,asia-east1-b,asia-east1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>asia-northeast1</td><td>asia-northeast1-a,asia-northeast1-b,asia-northeast1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>asia-south1</td><td>asia-south1-a,asia-south1-b,asia-south1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>asia-southeast1</td><td>asia-southeast1-a,asia-southeast1-b,asia-southeast1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>australia-southeast1</td><td>australia-southeast1-a,australia-southeast1-b,australia-southeast1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>europe-west1</td><td>europe-west1-b,europe-west1-c,europe-west1-d</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>europe-west2</td><td>europe-west2-a,europe-west2-b,europe-west2-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>europe-west3</td><td>europe-west3-a,europe-west3-b,europe-west3-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: Dedicated, BYOC<br>tier-7-gcp-v2-x86: Dedicated, BYOC<br>tier-8-gcp-v2-x86: Dedicated, BYOC<br>tier-9-gcp-v2-x86: Dedicated, BYOC<br></td></tr><tr><td>europe-west4</td><td>europe-west4-a,europe-west4-b,europe-west4-c</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>northamerica-northeast1</td><td>northamerica-northeast1-a,northamerica-northeast1-b,northamerica-northeast1-c</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>southamerica-east1</td><td>southamerica-east1-b,southamerica-east1-c,southamerica-east1-a</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>us-central1</td><td>us-central1-a,us-central1-b,us-central1-c,us-central1-f</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>us-east1</td><td>us-east1-b,us-east1-c,us-east1-d</td><td>tier-1-gcp-v2-x86: Dedicated, BYOC<br>tier-2-gcp-v2-x86: Dedicated, BYOC<br>tier-3-gcp-v2-x86: Dedicated, BYOC<br>tier-4-gcp-v2-x86: Dedicated, BYOC<br>tier-5-gcp-v2-x86: Dedicated, BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>us-east4</td><td>us-east4-a,us-east4-b,us-east4-c</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr><tr><td>us-west1</td><td>us-west1-a,us-west1-b,us-west1-c</td><td>tier-1-gcp-v2-x86: BYOC<br>tier-2-gcp-v2-x86: BYOC<br>tier-3-gcp-v2-x86: BYOC<br>tier-4-gcp-v2-x86: BYOC<br>tier-5-gcp-v2-x86: BYOC<br>tier-6-gcp-v2-x86: BYOC<br>tier-7-gcp-v2-x86: BYOC<br>tier-8-gcp-v2-x86: BYOC<br>tier-9-gcp-v2-x86: BYOC<br></td></tr></table><h3>AWS</h3>
<table><tr><th>Region</th><th>Zones</th><th>Throughput Tiers</th></tr><tr><td>ap-southeast-3</td><td>apse3-az1,apse3-az2,apse3-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>eu-north-1</td><td>eun1-az1,eun1-az2,eun1-az3</td><td>tier-1-aws-v3-arm: BYOC<br>tier-2-aws-v3-arm: BYOC<br>tier-3-aws-v3-arm: BYOC<br>tier-4-aws-v3-arm: BYOC<br>tier-5-aws-v3-arm: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>eu-south-1</td><td>eus1-az1,eus1-az2,eus1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>eu-west-3</td><td>euw3-az1,euw3-az2,euw3-az3</td><td>tier-1-aws-v2-arm: Dedicated, BYOC<br>tier-2-aws-v2-arm: Dedicated, BYOC<br>tier-3-aws-v2-arm: Dedicated, BYOC<br>tier-4-aws-v2-arm: Dedicated, BYOC<br>tier-5-aws-v2-arm: Dedicated, BYOC<br>tier-6-aws-v2-arm: Dedicated, BYOC<br>tier-7-aws-v2-arm: Dedicated, BYOC<br>tier-8-aws-v2-arm: Dedicated, BYOC<br>tier-9-aws-v2-arm: Dedicated, BYOC<br></td></tr><tr><td>ap-east-1</td><td>ape1-az1,ape1-az2,ape1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>ap-northeast-1</td><td>apne1-az4,apne1-az1,apne1-az2</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>af-south-1</td><td>afs1-az1,afs1-az2,afs1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>ap-south-1</td><td>aps1-az1,aps1-az2,aps1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>ap-southeast-1</td><td>apse1-az1,apse1-az2,apse1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>ap-southeast-2</td><td>apse2-az1,apse2-az3,apse2-az2</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>ca-central-1</td><td>cac1-az1,cac1-az2,cac1-az4</td><td>tier-1-aws-v2-arm: Dedicated, BYOC<br>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-arm: Dedicated, BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-arm: Dedicated, BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-arm: Dedicated, BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-arm: Dedicated, BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-arm: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>eu-central-1</td><td>euc1-az2,euc1-az3,euc1-az1</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>eu-west-1</td><td>euw1-az1,euw1-az2,euw1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>eu-west-2</td><td>euw2-az1,euw2-az2,euw2-az3</td><td>tier-1-aws-v2-arm: Dedicated, BYOC<br>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-arm: Dedicated, BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-arm: Dedicated, BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-arm: Dedicated, BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-arm: Dedicated, BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-arm: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>me-central-1</td><td>mec1-az1,mec1-az2,mec1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>sa-east-1</td><td>sae1-az1,sae1-az2,sae1-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-2-aws-v2-x86: BYOC<br>tier-3-aws-v2-x86: BYOC<br>tier-4-aws-v2-x86: BYOC<br>tier-5-aws-v2-x86: BYOC<br>tier-6-aws-v2-x86: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-9-aws-v2-x86: BYOC<br></td></tr><tr><td>us-east-1</td><td>use1-az2,use1-az4,use1-az5,use1-az6</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>us-east-2</td><td>use2-az1,use2-az2,use2-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr><tr><td>us-west-2</td><td>usw2-az1,usw2-az2,usw2-az3</td><td>tier-1-aws-v2-x86: BYOC<br>tier-1-aws-v3-arm: BYOC, Dedicated<br>tier-2-aws-v2-x86: BYOC<br>tier-2-aws-v3-arm: BYOC, Dedicated<br>tier-3-aws-v2-x86: BYOC<br>tier-3-aws-v3-arm: BYOC, Dedicated<br>tier-4-aws-v2-x86: BYOC<br>tier-4-aws-v3-arm: BYOC, Dedicated<br>tier-5-aws-v2-x86: BYOC<br>tier-5-aws-v3-arm: BYOC, Dedicated<br>tier-6-aws-v2-x86: BYOC<br>tier-6-aws-v3-arm: BYOC<br>tier-7-aws-v2-x86: BYOC<br>tier-7-aws-v3-arm: BYOC<br>tier-8-aws-v2-x86: BYOC<br>tier-8-aws-v3-arm: BYOC<br>tier-9-aws-v2-x86: BYOC<br>tier-9-aws-v3-arm: BYOC<br></td></tr></table><h3>AZURE</h3>
<table><tr><th>Region</th><th>Zones</th><th>Throughput Tiers</th></tr><tr><td>eastus</td><td>eastus-az1,eastus-az2,eastus-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>uksouth</td><td>uksouth-az1,uksouth-az2,uksouth-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>norwayeast</td><td>norwayeast-az1,norwayeast-az2,norwayeast-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>centralus</td><td>centralus-az1,centralus-az2,centralus-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>eastus2</td><td>eastus2-az1,eastus2-az2,eastus2-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>northeurope</td><td>northeurope-az1,northeurope-az2,northeurope-az3</td><td>tier-1-azure-v3-x86: Dedicated, BYOC<br>tier-2-azure-v3-x86: Dedicated, BYOC<br>tier-3-azure-v3-x86: Dedicated, BYOC<br>tier-4-azure-v3-x86: Dedicated, BYOC<br>tier-5-azure-v3-x86: Dedicated, BYOC<br></td></tr><tr><td>westeurope</td><td>westeurope-az1,westeurope-az2,westeurope-az3</td><td>tier-1-azure-v3-x86: BYOC<br>tier-2-azure-v3-x86: BYOC<br>tier-3-azure-v3-x86: BYOC<br>tier-4-azure-v3-x86: BYOC<br>tier-5-azure-v3-x86: BYOC<br></td></tr><tr><td>westus2</td><td>westus2-az1,westus2-az2,westus2-az3</td><td>tier-1-azure-v3-x86: BYOC<br>tier-2-azure-v3-x86: BYOC<br>tier-3-azure-v3-x86: BYOC<br>tier-4-azure-v3-x86: BYOC<br>tier-5-azure-v3-x86: BYOC<br></td></tr></table>