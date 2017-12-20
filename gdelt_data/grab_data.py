import requests
from tqdm import tqdm
import zipfile

global url,sub_name
url='http://data.gdeltproject.org/gdeltv2/'

for w in range(1,32):
    for j in range(0,24):
        mins=['00','15','30','45']
        for i in mins:
            if j<10:
                if w<10:
                    sub_name='2017100' + str(w) + '0' + str(j) + i + '00.export.CSV.zip'
                else:
                    sub_name='201710' + str(w) + '0' + str(j) + i + '00.export.CSV.zip'
            else:
                if w<10:
                    sub_name='2017100' + str(w) + str(j) + i + '00.export.CSV.zip'
                else:
                    sub_name='201710' + str(w) + str(j) + i + '00.export.CSV.zip'
            
            print(url + sub_name)
            
            try:
                res=requests.get(url + sub_name,stream=True)
            
                with open(sub_name,'wb') as f:
                    for data in tqdm(res.iter_content()):
                        f.write(data)

                zip_ref = zipfile.ZipFile(sub_name, 'r')
                zip_ref.extractall('./gdlet_data/.')
                zip_ref.close()
            except:
                continue

