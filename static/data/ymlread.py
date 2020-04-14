# process_yaml.py file

import yaml
from math import ceil
with open('india_male/235831.yaml') as file:
    # The FullLoader parameter handles the conversion from YAML
    # scalar values to Python the dictionary format
    fruits_list = yaml.load(file, Loader=yaml.FullLoader)
    a={}
    print(fruits_list['innings'][1])
    for i in fruits_list['innings'][1]['2nd innings']['deliveries']:
                    for j in i.keys():
                        if ceil(j/1) in a:
                            a[ceil(j/1)]+=i[j]['runs']['total']
                        else:
                            a[ceil(j/1)]=i[j]['runs']['total']
    print(a)
