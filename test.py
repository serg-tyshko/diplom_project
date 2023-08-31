import data
import sender_stand_request

# создаем тест который берет ответ из запроса на создание нового заказа и подменяетего в запросе на поиск
def test_code_200():
    track = sender_stand_request.post_new_order(data.body).json()['track']
    response = sender_stand_request.get_poisk_zakaza(track)
    assert response.status_code == 200
# проверяем что статус код 200