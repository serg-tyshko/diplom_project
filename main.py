import requests
URL_SERVICE = "https://e1057692-ce3a-45ec-83b5-be495ec1b2c5.serverhub.praktikum-services.ru"
CREATE = "/api/v1/orders"
CHEK = "/api/v1/orders/track?t="

headers = {
    "Content-Type": "application/json"
}
new_body = {
    "firstName": "Naruto",
    "lastName": "Uchiha",
    "address": "Konoha, 142 apt.",
    "metroStation": 4,
    "phone": "+7 800 355 35 35",
    "rentTime": 5,
    "deliveryDate": "2020-06-06",
    "comment": "Bomji toje ludi",
    "color": [
        "BLACK"
    ]
}

def post_new_order(body):
    return requests.post(URL_SERVICE + CREATE,
                         json=body,
                         headers=headers)


def get_poisk_zakaza(track):
    return requests.get(URL_SERVICE + CHEK  + str(track))

def test_200_code():
    track = post_new_order(new_body).json()['track']
    response = get_poisk_zakaza(track)
    assert response.status_code == 200