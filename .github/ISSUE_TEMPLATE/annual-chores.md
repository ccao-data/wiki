---
name: Annual chore checklist
about: Tasks to complete following the annual iasWorld rollover
title: Complete annual chore checklist
labels: ''
projects: ["ccao-data/22"]
assignees: ''
---

# Annual chore checklist

These chores must be completed once a year following the iasWorld rollover:

- [ ] [`data-architecture`](https://github.com/ccao-data/data-architecture/) -
  Bump the lower bound year for iasWorld data tests
  (`vars.data_test_iasworld_year_start`) in
  [`dbt/dbt_project.yaml`](https://github.com/ccao-data/data-architecture/blob/master/dbt/dbt_project.yml)
    - Double-check to make sure the start year is still at least one year
      before the end year (`vars.data_test_iasworld_year_end`). If not,
      push the end year back
    - Example PR: https://github.com/ccao-data/data-architecture/pull/1011
- [ ] [`service-spark-iasworld`](https://github.com/ccao-data/service-spark-iasworld/) -
  Bump the lower bound year for the nightly weekday Spark ingest job (the
  `min_year` anchor) in
  [`config/default_jobs/weekday_jobs.yaml`](https://github.com/ccao-data/service-spark-iasworld/blob/main/config/default_jobs/weekday_jobs.yaml)
    - Example PR: https://github.com/ccao-data/service-spark-iasworld/pull/36
- [ ] [`process-appeal-worksheets`](https://github.com/ccao-data/process-appeal-worksheets) -
  Bump `APPEAL_YEAR` variable in
  [`appeal-worksheets/.Renviron`](https://github.com/ccao-data/process-appeal-worksheets/blob/main/appeal-worksheets/.Renviron)
    - Example PR: https://github.com/ccao-data/process-appeal-worksheets/pull/45
- [ ] Update the scheduled task on the VM that runs daily IC reference file
  export so that the Python script filters for the current year of data
    - Full list of tasks:
      - Open a connection to the VM using the **Remote Desktop Connection**
        app
      - Login to your user account
      - On the VM, open the **Task Scheduler** app
      - Click on **Task Scheduler Library** in the left-hand sidebar
      - Right-click the **Export commercial QC reference files** task and
        select **Properties**
      - In the **Actions** tab, select the action (there should only be
        one) and click the **Edit** button
      - In the **Add arguments (optional)** text input box, bump the year
        that follows the `--where` option to the current calendar year
        (e.g. `--where "taxyr = '2026'"`)
      - Click **OK** twice to save the update to the action and close the
        Properties dialog
      - Test the change by right-clicking the task and selecting **Run**
