# AWS Notes

## AWS CLI installation
* Installation [https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
* Configure AWS CLI [https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

```shell
$ aws configure
AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: us-west-2
Default output format [None]: json
```

* Create Named Profile: `aws configure --profile siva`

**~/.aws/credentials** (Linux & Mac) or **%USERPROFILE%\.aws\credentials** (Windows)

```shell
[default]
aws_access_key_id=YOUR_ACCESS_KEY_ID
aws_secret_access_key=YOUR_SECRET_ACCESS_KEY

[siva]
aws_access_key_id=YOUR_ACCESS_KEY_ID
aws_secret_access_key=YOUR_SECRET_ACCESS_KEY
```

**~/.aws/config** (Linux & Mac) or **%USERPROFILE%\.aws\config** (Windows)

```shell
[default]
region=us-west-2
output=json

[profile siva]
region=us-east-1
output=text
```

* Run commands using specific profile: `$ aws ec2 describe-instances --profile siva`

* To use a named profile for multiple commands:
```shell
$ export AWS_PROFILE=siva  //Linux or MacOS
C:\> setx AWS_PROFILE siva //Windows
```

## Simple Storage Service (S3)

* [Storage Classes](https://aws.amazon.com/s3/storage-classes/)
    * Amazon S3 Standard (S3 Standard)
    * Amazon S3 Intelligent-Tiering (S3 Intelligent-Tiering)
    * Amazon S3 Standard-Infrequent Access (S3 Standard-IA)
    * Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA)
    * Amazon S3 Glacier (S3 Glacier)
    * Amazon S3 Glacier Deep Archive (S3 Glacier Deep Archive)
    * S3 Outposts storage class
    
* Versioning
  
* Encryption
  
    * [Server Side Encryption SSE](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html)
        * SSE-S3/AES-256 (Amazon S3-Managed Keys)
        * SSE-KMS (Customer Master Keys (CMKs) Stored in AWS Key Management Service (SSE-KMS))
        * SSE-C (Customer-Provided Keys)
    * [Client-Side Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html)

* CORS
* Bucket Policies
  
```json
{
  "Id": "Policy1608432684713",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1608432681596",
      "Action": [
        "s3:GetObject",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::bucket-name/*",
      "Principal": "*"
    }
  ]
}
```
* Life Cycle Rules
* Cross Region Replication
* [AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)

```shell
$ aws s3 ls //list buckets
$ aws s3 mb s3://sivalabs-000  //create bucket
$ aws s3 lb s3://sivalabs-000  //list bucket contents
$ aws s3 rb s3://sivalabs-000  //remove bucket
$ aws s3 rb s3://sivalabs-000 --force //remove bucket force
$ aws s3 rm s3://bucket-name/filename.txt 
$ aws s3 rm s3://bucket-name/folder1 --recursive 
$ aws s3 mv s3://bucket-name/example s3://my-bucket/   //moves all objects from s3://bucket-name/example to s3://my-bucket/
$ aws s3 cp s3://bucket-name/example s3://my-bucket/
$ aws s3 cp filename.txt s3://bucket-name
$ aws s3 cp s3://bucket-name/filename.txt ./
$ cat "hello world" | aws s3 cp - s3://bucket-name/filename.txt
$ aws s3 cp s3://bucket-name/filename.txt -
hello world
$ aws s3 presign s3://sivalabs-000/images/pug.jpg --expire 300

```

