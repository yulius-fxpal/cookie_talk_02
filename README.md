# Cookie Talk #2 Demos

## Docker

* Look at Dockerfile to see how the image is made.
* Look at Makefile to see the command lines to build and run the image.

```bash
make build
make run
```

## Slurm

* `ex1.sh` is script to do some processing
* `run.sh` schedules to run `ex1.sh` in slurm

## Jupyter

* `filetypes` directory with sample files to view
* `Lorenz Differential Equations.ipynb` sample notebook
* How to create environment to use `Lorenz Differential Equations.ipynb`

```bash
conda create -n cookie2
source activate cookie2
conda install ipykernel ipywidgets matplotlib scipy
```

* How to save/load conda environments

```bash
# save environment
conda env export > environment.yml

# create new environment
# -n optional because the name is already in environment.yml
conda create [-n env_name] -f environment.yml

```

* Mask_RCNN was not added to the repo.  It's a good excersize to try to get that running in jupyter lab yourself.
https://github.com/matterport/Mask_RCNN

* Make Tensorflow not take up the whole GPU

```python
import os

# Limit which GPU you are using
# Ex. '0', '1', '0,1'
os.environ['CUDA_VISIBLE_DEVICES'] = '0'

# Limit GPU memory allocation
# per_process_gpu_memory_fraction - Change accordingly
import tensorflow as tf
from keras.backend.tensorflow_backend import set_session
config = tf.ConfigProto(
    gpu_options = tf.GPUOptions(
        per_process_gpu_memory_fraction=0.4,
        allow_growth=True
    ),
    device_count = {'GPU': 1}
)
set_session(tf.Session(config=config))
```

## Git

* Add the following in `~/.gitconfig`

```
[alias]
        lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
        lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
        lg = !"git lg1"
```

* The script is as follows

```bash
# create branch
git branch feature1
git branch feature2

# work on feature1
git checkout feature1
touch feature1.txt
git add feature1.txt
git commit -m "add feature1"
echo "feature change1" >> feature1.txt
git commit -m "modify feature1"

# work on feature2
git checkout feature2
touch feature2.txt
git add feature2.txt
git commit -m "add feature2"
echo "feature change2" >> feature2.txt
git commit -m "modify feature2"

# look at log
git lg

# commits in master
git checkout master
touch masterfeature.txt
git add masterfeature.txt
git commit -m "add feature in master"

# Merge example
git checkout master
git merge feature1
git merge feature2
git lg

# reset
git reset --hard [initial commit hash]

# Rebase example
git checkout master
git rebase feature1
git rebase feature2
git lg

```

