# script to delete videos with low quality[height=250]
while read url
do 
ffprobe -v quiet -print_format json -show_format -show_streams $url | grep "\"height\"" | grep "250" > /dev/null
if [ $? -eq 0 ] 
then 
#echo $url
echo "Removing $url"
rm $url 
fi 
done < files.txt
