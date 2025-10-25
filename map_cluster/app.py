from flask import Flask, render_template, send_from_directory, request, jsonify
import csv
import json

app = Flask(__name__, static_url_path='/static')

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/schools")
def schools():
    print(request.args)
    pass
    #return "<p>Hello, World!</p>"
    
@app.route('/objects')
def objects():
    result = []
    print('!!!')
    with open('data.csv', newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile, delimiter=';')
        next(reader)
        count = 0
        for row in reader:
            
            # print(row)
            coordinates_str = row['geodata_center']
            coordinates_dict = json.loads(coordinates_str.split('=')[1].split(']')[0] + ']')
            
            # lng = float(coordinates_dict.split(',')[0])
            # lat = float(coordinates_dict.split(',')[1])
            result.append({
                "type": "Feature",
                "id": count,
                "geometry": {
                    "type": "Point",
                    "coordinates": [coordinates_dict[1], coordinates_dict[0]]
                }
                ,
                'properties': {
                    'balloonContent': row['ShortName']
                    ,
                    'clusterCaption': row['ShortName'],
                    'hintContent': row['ShortName']
                }
            })
            count+=1
            # if count > 1050: break
    result = {
        'type': 'FeatureCollection',
        'features': result
    }
    print(count)
    # print(result)
    callback = request.args.get('callback')
    response = f"{callback}({json.dumps(result)})"
    # response = f"{callback}({result})"
    # return jsonify(response)
    return response, 200, {'Content-Type': 'application/javascript'}
    # return json.dumps(result)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)