# Mapreduce programming with Python

This is a Python projects that contains two MapReduce applications:
    - Word Count
    - Flights By Carriers
    - Flights By Origin
    - Flights By Destination

## Assumption

Need to use cisc-525-util repository to:
    - start up hadoop
    - prepare data (make sure you have the data downloaded and stored in the right place)
    - verify data loaded correctly

## Run Word Count MR application

```shell script
./word_count_run.sh /user/student/shakespeare/tragedy/othello.txt /tmp/othello
```

## Run airline performance MR application 

Flights by Carries
```shell script
./fbc_run.sh /user/student/airline/2003.csv /tmp/2003
```

Flights by Origin
```shell script
./fbo_run.sh /user/student/airline/2003.csv /tmp/2003_fbo
```

Flights by Destination
```shell script
./fbd_run.sh /user/student/airline/2003.csv /tmp/2003_fbd
```

## Unit test

```shell script
pip3 install pytest
```

```shell script
pytest 
coverage run --source=app -m pytest 
coverage report -m
```

- include these in the __init__.py:
````python
import sys
sys.path.append('.')
````
