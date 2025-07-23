# 📊 Fresh Enrollments Analytics

A modern data analytics project built to analyze **fresh enrollments** at the PrashantAdvait Foundation. This project leverages dbt and Snowflake to provide insights into student demographics, channel attribution, and donation trends.

---

## 📌 Project Objective

The **Fresh Enrollments Analytics** project aims to track and analyze new enrollments to uncover valuable insights into:

- **Demographics** (gender, age, address)
- **Channels of engagement** (social media, website, events)
- **Donation patterns**

By transforming raw data into structured insights, this project empowers stakeholders to understand where students are coming from, who is guiding them, and how they contribute.

---

## ⚙️ Tech Stack

| Tool            | Purpose                          |
|-----------------|----------------------------------|
| **dbt Cloud**   | Data transformation & scheduling |
| **Snowflake**   | Cloud data warehouse             |
| **Power BI**    | Dashboard & visualization        |

---

## 🧩 Data Sources

- **Synthetic data** generated to simulate real-world enrollments
- Data is organized into the following **source tables**:
  - `raw.fresh_enrollments`
  - `raw.channels`
  - `raw.counsellors`
- Currently loaded manually (scheduled runs can be added later)

---

## 🧱 Data Models

This project is structured using a layered dbt approach:

### 🧩 Staging Layer (`stg_`)
Raw data is cleaned and renamed with consistent naming conventions.

- `stg_fresh_enrollments`
- `stg_channels`
- `stg_counsellors`

### 🔄 Intermediate Layer (`int_`)
Combines and enriches staging data before feeding marts.

- `int_fresh_enrollments`  
  Performs joins across enrollments, counselors, and channels. Filters for **only new enrollments** and applies logic for incremental loading.

### 🏗️ Marts Layer
Core analytics-ready tables used for reporting and dashboarding.

- `fact_fresh_enrollments`  
  Contains one row per enrollment, with all enriched details including demographics, donation amount, counselor and channel info.

- `dim_channels`  
  Describes each channel through which a student was referred (e.g., YouTube, Facebook, Instagram etc.)

- `dim_counsellors`  
  Dimension table mapping counselor details like name, ID, and associated enrollments.

### 🛠️ Macros & Tests

- **Macro**: `generate_schema_name`  

- **Tests**:
  - `not_null`
  - `unique`
  - `accepted_values`
  - `values_between_range`
  - `is_valid_contact_number` (custom)

This structure enables clean, testable, and scalable analytics workflows using dbt.

---

## 🧱 dbt Project Structure

This project follows a modular dbt structure with layered transformations:

```text
├── staging/
│   ├── stg_fresh_enrollments.sql
│   ├── stg_channels.sql
│   └── stg_counsellors.sql

├── intermediate/
│   └── (int_fresh_enrollments.sql) ← incremental

├── marts/
│   ├── fact_fresh_enrollments.sql  
│   ├── dim_channels.sql
│   └── dim_counsellors.sql

├── macros/
│   └── generate_schema_name

├── tests/
│   └── test_is_valid_contact_number

└── docs/
    └── schema.yml (with all model and column descriptions)
```

---

## 📚 Documentation

Full model and column-level documentation is available here:  
👉 **[Fresh Enrollments Analytics Documentation](https://ramnaresh-ahi.github.io/fresh_enrollments_analytics/)**

---

## 📈 Key KPIs

- **Total Enrollments**
- **Total Counselors**
- **Total Donation**
- **Average Donation per Enrollment**

---

## 🖼️ Dashboard Preview

> Visualizes enrollment volume, donations, counselor contributions, and channel breakdown.

---

## 🔍 Features

- ✅ **Incremental models** for scalable processing (`fact_fresh_enrollments`)
- ✅ **Custom macro**: `generate_schema_name` 
- ✅ **Data tests**:
  - Not null
  - Unique
  - Accepted values
  - Value ranges
  - Regex validation for contact numbers
- ✅ **Channel and counselor mapping**
- ✅ **Power BI dashboard** to visualize key metrics (screenshot included above)

---

## 🚀 How to Run Locally

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ramnaresh-ahi/fresh_enrollments_analytics.git
   cd fresh_enrollments_analytics
   ```

2. **Install dependencies:**

   ```bash
   dbt deps
   ```

3. **Run models:**

   ```bash
   dbt run
   ```

4. **Run tests:**

   ```bash
   dbt test
   ```

5. **View documentation:**

   ```bash
   dbt docs generate
   dbt docs serve
   ```

---

## 👨‍💻 Author

**Ramnaresh Ahirwar**  
Analytics Engineer | dbt & Cloud Data Warehouse Enthusiast  
[LinkedIn](https://www.linkedin.com/in/ramnaresh-ahirwar-77abc/) · [GitHub](https://github.com/ramnaresh-ahi)

---

## 📌 License

This project is for educational and demonstration purposes.  
Data is synthetic and not derived from real student enrollments.


