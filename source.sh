echo "Training source on Office dataset"
python image_source.py --trte val --gpu_id 0 --dset office --max_epoch 100 --s 0
echo "Training source on Office-home dataset"
python image_source.py --trte val --gpu_id 0 --dset office-home --max_epoch 100 --s 0
echo "Training source on VISDA-C dataset"
python image_source.py --gpu_id 0 --dset VISDA-C --net resnet101 --lr 1e-3 --max_epoch 10 --s 0