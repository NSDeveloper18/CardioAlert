Блокнот с кодами для тренировки нейронной сети:
https://colab.research.google.com/drive/1HPXZd-2h2DyXIfdkrVoNkyV0P14aG7JG?usp=sharing

Название проекта: CardioAlert

Описание проекта: Cardio Alert- IOS приложение для расшифровки ЭКГ. Создано для использования клиниками и их пациентами. Использование приложения возможно на 3 языках (английский, русский, узбекский) и включает в себя:
- тест для выявления риска сердечно-сосудистых заболеваний
- запись на процедуру ЭКГ 
- рекомендуемые клиники с их адресом, графиком работы и контактными данными
- самостоятельная проверка ИИ с помощью камеры телефона (для этого просто сфотографируйте через приложение физический рисунок ЭКГ и модель сама определит потенциальные проблемы сердца)
Готовая электрокардиограмма в виде файла загружается в приложение и, с помощью ИИ, выполняется оценка и предоставляются дальнейшие рекомендации.


Цель проекта: Использование Cardio Alert способствует решению таких проблем, как:
-нехватка опытных врачей-кардиологов на периферии
-трата времени на отстаивание очереди
-поиск компетентных клиник
-экономия времени врачей на приоритетные задачи

Роли участников: 
Акрамов Рашод -   тимлид проекта, спикер и data scientist 
Мамадуллаев Бобомурод - Backend разработчик, дизайнер
Ботиров Шахзод - iOS разработчик 
Хегай Юлия - консультант по медицинской части

Основные направления работы: Проект рассчитан на быструю связь между пациентом и больницами для связи с целью снимка ЭКГ и в обратном порядке отправке ЭКГ снимка в мобильное приложения для обработки файла с помощью нейронных сетей и поиска потенциальных проблем

Краткое описание блоков системы: 
1. Мобильное приложение (Frontend):
Основной интерфейс для пользователей — пациентов. Здесь пользователи выбирают локацию больницы, где проводят ЭКГ, бронируют очередь, а также получают результаты обследования. Приложение также отображает результаты анализа и рекомендации.
 2. Модуль бронирования:
Управляет расписанием доступных локаций больниц, поддерживает создание брони, уведомления для пациентов о времени и месте проведения ЭКГ, а также интеграцию с больничными системами для подтверждения записи.
 3. Модуль обработки данных ЭКГ (AI/ML):
Этот модуль принимает цифровые версии ЭКГ после проведения обследования, анализирует изображение с использованием алгоритмов машинного обучения, чтобы автоматически выявлять возможные заболевания сердца.
 4. Сервер и API:
Центральная часть системы, обеспечивающая связь между мобильным приложением, базой данных, больничными системами и ИИ-модулем. Через API происходит передача данных (бронирования, результаты ЭКГ, диагнозы) между клиентом и сервером.
 5. База данных:
Хранит информацию о пользователях (пациентах), их бронированиях, результатах ЭКГ и выводах ИИ. Также обеспечивает безопасность данных, управление правами доступа и историю обращений.
 6. Интеграция с больничными системами:
Этот блок обеспечивает передачу информации между больничными информационными системами (например, системами управления медицинскими записями) и сервером проекта. Он автоматически отправляет результаты ЭКГ в мобильное приложение после обследования.
 7. Модуль безопасности:
Отвечает за шифрование данных, управление доступом и конфиденциальность. Включает защиту персональных данных, медицинской информации и безопасную передачу файлов ЭКГ.
 8. Система уведомлений:
Этот блок отвечает за отправку пациентам напоминаний о предстоящих бронированиях, готовности результатов ЭКГ и иных важных уведомлений.

Интеграция и источники данных : 
1.Интеграция с больничными системами (HIS):
 • Больницы, участвующие в проекте, должны быть подключены к системе через стандартизированные интерфейсы, такие как HL7 или FHIR, которые позволяют передавать информацию о пациентах и их записи на процедуры.

2. Интеграция с оборудованием для снятия ЭКГ:
 • Мобильное приложение и серверная часть системы интегрируются с больничным оборудованием для проведения ЭКГ через стандарты передачи медицинских изображений, такие как DICOM.
 • Полученные файлы ЭКГ передаются через API из больничных устройств в мобильное приложение для обработки. Это могут быть изображения или другие цифровые данные, передаваемые на сервер для дальнейшего анализа ИИ.

3. Интеграция ИИ модуля:
 • Модуль ИИ, который занимается обработкой изображений ЭКГ, интегрируется с сервером и получает файлы ЭКГ, загруженные из больничных систем.
 • После анализа ИИ возвращает результаты (диагнозы и рекомендации), которые автоматически отправляются в мобильное приложение для отображения пользователю

Источники данных: Для обучения нейронной сети база данных была собрана при сотрудничестве с кардиологами из Семашко
UML-диаграмма:


![telegram-cloud-photo-size-2-5438355064587674819-y](https://github.com/user-attachments/assets/4f18d144-74a6-49b6-9172-bfb5675fc7af)

![telegram-cloud-photo-size-2-5438355064587674829-y](https://github.com/user-attachments/assets/276b52ce-65cf-440a-a57a-8f13326cd9c1)

