## Имя: Дорджиев Виктор
## Группа: ЭФМО-02-25
# Проект notes-api

Задачи проекта
1.	Освоить принципы проектирования REST API.
2.	Научиться разрабатывать структуру проекта backend-приложения на Go.
3.	Спроектировать и реализовать CRUD-интерфейс (Create, Read, Update, Delete) для сущности «Заметка».
4.	Освоить применение слоистой архитектуры (handler → service → repository).
5.	Подготовить основу для интеграции с базой данных и JWT-аутентификацией в следующих занятиях.

REST (Representational State Transfer) — это архитектурный стиль
взаимодействия клиентских и серверных приложений через протокол HTTP.
Основные принципы:
- Ресурсность — всё в API представлено как ресурс (например, /notes).
- Стандартизированные методы HTTP:
  - GET — получение данных;
  - POST — создание ресурса;
  - PATCH/PUT — обновление;
  - DELETE — удаление.
- Без состояния (stateless) — каждый запрос содержит всю
необходимую информацию.
- Единообразие интерфейса — структура запросов и ответов
одинакова для всех ресурсов.

CRUD (Create, Read, Update, Delete) — это базовые операции над
ресурсами в информационных системах:
- Create — создание нового ресурса,
- Read — чтение (получение) ресурса,
- Update — обновление данных,
- Delete — удаление ресурса.
В REST API эти операции напрямую отображаются на методы HTTP.

---

## Установка и запуск

(Необходимы предустановленные Go версии 1.22 и выше и Git)

Клонировать репозиторий:

```
git clone <URL_РЕПОЗИТОРИЯ>
cd notes-api
```

Команда запуска сервера:

```
go run ./cmd/api
```
```
make compose-up
```

------

## Структура проекта

```plaintext
notes-api/
├── go.mod
├── go.sum
├── cmd/
│   └── api/
│       └── main.go
├── internal/
│   ├── core/
│   │   └── note.go
│   ├── http/
│   │   ├── router.go
│   │   └── handlers/
│   │       └── notes.go
│   └── repo/
│       └── note_mem.go
├── api/
│   └── openapi.yaml
├── README.md
└── .gitignore
```

## Отчёт о проделанной работе
### Создание заметки POST
```
http://185.250.46.179:8083/api/v1/notes/
```
```
{"title":"Первая","content":"тест"}
```

<img width="569" height="501" alt="image" src="https://github.com/user-attachments/assets/60bac614-03d6-4a43-82be-a1ca32c1adca" />


### Получение списка заметок GET
```
http://185.250.46.179:8083/api/v1/notes/
```

<img width="605" height="723" alt="image" src="https://github.com/user-attachments/assets/e427ef95-d869-4946-8a80-9b5dca5b83f0" />


### Получение заметки по id GET
```
http://185.250.46.179:8083/api/v1/notes/5/
```

<img width="547" height="364" alt="image" src="https://github.com/user-attachments/assets/c00944dd-dcde-4a0d-980c-35f087b42871" />


### Обновление заметки PATCH
```
http://185.250.46.179:8083/api/v1/notes/5/
```
```
{"title":"Обновлённый заголовок","content":"Обновлённый текст"}
```

<img width="545" height="374" alt="image" src="https://github.com/user-attachments/assets/8dea3c18-0743-435e-8853-35e367ea698f" />


### Удаление заметки DELETE
```
http://185.250.46.179:8083/api/v1/notes/5/
```

<img width="513" height="310" alt="image" src="https://github.com/user-attachments/assets/0638099e-d01b-496a-8d46-59e449c8d208" />


------

## Заключение
1. Выполнены цели работы
2. Настроен роутинг на chi
3. Реализовано in-memory хранилище
4. Выполнена проверка работы эндпоинтов запросами POST, GET, PATCH и DELETE
