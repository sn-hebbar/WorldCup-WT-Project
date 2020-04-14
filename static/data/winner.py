import yaml
from math import ceil
import glob
l=glob.glob('india_male/*.yaml')
match={}
win={}
for fi in l:
	try:
		with open(fi) as file:
		    # The FullLoader parameter handles the conversion from YAML
		    # scalar values to Python the dictionary format

		    fruits_list = yaml.load(file, Loader=yaml.FullLoader)
		    if 'result' not in fruits_list['info']['outcome']:
			    for i in fruits_list['info']['teams']:
			    	if i!='India':
			    		if i in match:
		for i in fruits_list['info']['teams']:
			    	if i!='India':
			    		if i in match:
			    			if fruits_list['info']['outcome']['winner']==i:
			    				match[i]+=1
			    			elif fruits_list['info']['outcome']['winner']=='India':
			    				match[i]+=1
			    				win[i]+=1
			    		else:
			    			if fruits_list['info']['outcome']['winner']==i:
			    				match[i]=1
			    				win[i]=0
			    			elif fruits_list['info']['outcome']['winner']=='India':
			    				match[i]=1
			    	    			if fruits_list['info']['outcome']['winner']==i:
			    				match[i]+=1
			    			elif fruits_list['info']['outcome']['winner']=='India':
			    				match[i]+=1
			    				win[i]+=1
			    		else:
			    			if fruits_list['info']['outcome']['winner']==i:
			    				match[i]=1
			    				win[i]=0
			    			elif fruits_list['info']['outcome']['winner']=='India':
			    				match[i]=1
			    				win[i]=1
			print(fi)
	except Exception as e:
		print(fruits_list['info']['outcome'])
		print(e)
		print(fi)

print(match,win)
