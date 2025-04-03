Set working directory to the dockerfiles folder of this repository:

```
cd ~/pose-estimation-dl/analysis/dockerfiles
```

Run:

```
docker build -t diplomat-dlc -f Dockerfile.kasm.diplomatdlc .
```

Then run

```
docker run --name kasm_diplomat -it -p 6901:6901 diplomat-dlc
```

Then navigate to <https://localhost:6901/>

To run Diplomat:

1. Open the terminal in the Desktop
2. Run:
```
source /opt/venv-dlc/bin/activate
```

You can now use Diplomat's tracking functionality

To verify Diplomat is working run the following code in the terminal:

1. Download and unzip files containing a pretrained DeepLabCut project

```
curl https://zenodo.org/records/14232002/files/DLC_5bp.zip --output DLC_5bp.zip && unzip DLC_5bp.zip
```
```
curl https://zenodo.org/records/14232002/files/N5PZS.avi --output N5PZS.avi
```

2. Verify Diplomat's tracking works

```
diplomat track -c test_dlc_5/config.yaml -v N5PZS.avi -no 3
```

3. Verify Diplomat's GUI works

```
diplomat track_and_interact -c test_dlc_5/config.yaml -v N5PZS.avi -no 3
```