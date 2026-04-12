-- create DATABASE schooldata
create database schooldata;

-- create schema schooldata
create schema schooldata;

-- table for schools
CREATE TABLE schooldata.schools (
    global_id BIGINT,                   -- Уникальный глобальный идентификатор
    institution_type TEXT,              -- Тип образовательной организации
    organization_status TEXT,           -- Статус организации
    kpp TEXT,                           -- Код причины постановки на учет (КПП)
    licensing_and_accreditation TEXT,   -- Информация о лицензировании и аккредитации (текст)
    ogrn TEXT,                          -- Основной государственный регистрационный номер (ОГРН)
    legal_form TEXT,                    -- Организационно-правовая форма
    subordination TEXT,                 -- Подчиненность
    director_fullname TEXT,             -- ФИО директора
    legal_address TEXT,                 -- Юридический адрес
    contact_phone TEXT,                 -- Контактный телефон
    email TEXT,                         -- Электронная почта
    website TEXT,                       -- Веб-сайт
    education_programs TEXT,            -- Образовательные программы (текст)
    education_services TEXT,            -- Образовательные услуги (текст)
    students_count TEXT,                -- Количество учащихся (текст)
    preschool_students_count TEXT,      -- Количество дошкольников (текст)
    ekis_code TEXT,                     -- Код единой информационной системы образования (ЕКИС)
    full_name TEXT,                     -- Полное наименование организации
    short_name TEXT,                    -- Сокращенное наименование
    number TEXT,                        -- Номер организации
    addresses TEXT,                     -- Адреса учреждения (текст)
    inn TEXT,                           -- Индивидуальный налоговый номер (ИНН)
    clubs_and_sections TEXT,            -- Кружки и секции (текст)
    geodata TEXT,                       -- Географические данные (координаты и т.п.)
    geodata_center TEXT                 -- Координаты центра объекта
);
-- table for olimpic winners
CREATE TABLE schooldata.olimpic_winners (
    global_id BIGINT,                   -- Идентификатор строки (global_id)
    full_name TEXT,                     -- Полное официальное наименование образовательного учреждения
    short_name TEXT,                    -- Сокращённое наименование образовательного учреждения
    competition_type TEXT,              -- Тип олимпиады ("Всероссийская")
    stage DECIMAL(2,1),                 -- Этап олимпиады (число с плавающей точкой)
    grade INTEGER,                      -- Класс ученика
    competition_name TEXT,              -- Наименование олимпиады
    subject_profile TEXT,               -- Профиль олимпиады (предмет)
    status TEXT,                        -- Статус (победитель / призёр)
    participation_year TEXT             -- Учебный год участия в олимпиаде
);