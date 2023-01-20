Download the dataset : https://drive.google.com/file/d/0B81rNlvomiwed0V1YUxQdC1uOTg/view?resourcekey=0-2SNWq0CDAuWOBRRBL7ZZsw

Step 1 : To Generate List for the datasets. 
Three different datasets are used (office, office-home, VISDA-C). Datasets are stored in data directory.
To generate the list for the dataset, Run '''python readfile.py''' by changing the folder path for each datasets.

*NOTE : After the list is generated, we need to change the name of the generated list.

Object|
	|--data |
    		|--office|
	     		|---amazon
	     		|---dslr
	     		|---webcam
	     		|---amazon_list.txt
	     		|---dslr_list.txt
	     		|---webcam_list.txt
	
    		|--office-home|
	     			|---Art
	     			|---Clipart
	     			|---Product
	     			|---Real_world
	     			|---Art_list.txt
	     			|---Clipart_list.txt
	     			|---Product_list.txt
				|---RealWorld_list.txt
    		|--VISDA-C|
			  |-----|---test
	     			|---train
	     			|---validation
	     			|---train_list.txt
				|---validation.txt

Step 2: Once the list are generated according to above directory, Run Source.sh file to train source for each datasets.
Individual commands :
----office : 'python image_source.py --trte val --gpu_id 0 --dset office --max_epoch 100 --s 0'
----office-home: 'python image_source.py --trte val --gpu_id 0 --dset office-home --max_epoch 100 --s 0'
---VISDA-C: 'python image_source.py --gpu_id 0 --dset VISDA-C --net resnet101 --lr 1e-3 --max_epoch 10 --s 0'

Step 3: After sucessfully executing the source bash file, Run Target.sh file to adapt the source model to target domain of each datasets. 
Individual commands :
----office : 'python image_target.py --cls_par 0.3 --gpu_id 0 --dset office --s 0'
----office-home: 'python image_target.py --cls_par 0.3 --gpu_id 0 --dset office-home --s 0'
----VISDA-C: ' python image_target.py --cls_par 0.3 --da uda --dset VISDA-C --gpu_id 0 --s 0 --net resnet101 --lr 1e-3'
Results will be stored in Source and target directory.

--Source|
	|--- uda|
		|----office
		|----office-home
		|----VISDA-C
--Target|
	|--- uda|
		|----office
		|----office-home
		|----VISDA-C


Results : 

Office -  Source : 87.23

	- Target : A->D - 93.57 / A->W 91.82
		

Office-Home :  
	-Source : 73.2

	- Target : A->C - 56.27 / A->P 77.97 / A->R - 81.55

VISDA-C : 
-Source : Task: T, Iter:21440/21440; Accuracy = 99.60%
Individual result on different objects.
100.0
99.86
98.98 
99.0 
100.0 
99.86 
99.43 
100.0 
99.9 
99.92
99.38
98.85

-Target : Task: Train->Validation, Iter:12990/12990; Accuracy = 82.41%
Individual result on different objects.

94.84 
87.22 
77.01 
55.43 
94.07 
95.71 
80.26 
79.95 
89.6 
88.56 
85.62 
60.58
	
