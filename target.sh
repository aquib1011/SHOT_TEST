echo "Adaptation to other target domains D and W, respectively"
python image_target.py --cls_par 0.3 --gpu_id 0 --dset office --s 0
echo "Adaptation to other target domains"
python image_target.py --cls_par 0.3 --gpu_id 0 --dset office-home --s 0
echo "Unsupervised Closed-set Domain Adaptation (UDA) on the VisDA-C datase"
python image_target.py --cls_par 0.3 --da uda --dset VISDA-C --gpu_id 0 --s 0 --net resnet101 --lr 1e-3
