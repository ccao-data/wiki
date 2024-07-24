# Add Columns to Open Data Assets

The data team maintains a motley collection of [open data assets](https://datacatalog.cookcountyil.gov/browse?tags=cook+county+assessor). The [Athena views](https://ccao-data.github.io/data-architecture/#!/overview/ccao_data_athena) that feed these assets are updated regularly with new features, and it's important to maintain parity.

1. [Log in to](https://datacatalog.cookcountyil.gov/login) the open data portal using the Data team's credentials.
2. Click "My Assets" on the left.
3. Click the asset you'd like to update.
4. Click "Edit" in the top right of the asset's landing page.
5. Click the "Add Data" drop down menu, then select "Replace".
6. On the left, click "Connect to an External Data Source (Socrata Gateway)".
7. Find the same Athena view that already feeds the asset being edited. This may take some rooting around. Once the correct view is located, click "Use this data source".
8. The open data portal will begin importing the updated table - this takes a long time. Check back on your draft asset later once it's populated with new data.
9. Click "Review Data" under "Review & Configure Data".
10. On the left, click "Add Column".
11. Choose a "Source Column", a "Type", and enter "Diplay" and "Field" names according to convention.
12. Click "Done" in the bottom right.
13. If the column needs to be formatted, you can scroll to the end of the "Data Preview" window and click the three vertical dots next to the columns name. Select "Column Formatting" or "Data Transforms". If the column is transformed, make sure to [record the transformation syntax](https://github.com/ccao-data/data-architecture/tree/master/socrata/column_transformations).
14. Return to the "Data Preview", and click "Done".
15. Click "Edit Metadata" under "Edit Column Metadata".
16. Move the column where it should be located relative to others, add a description, hide it if so desired, and click "Save".
17. Click "Update" in the top right.
18. Lastly, after the asset has been successfully updated, click "Actions" in the top right of its main page, then select "Schedule Updates".
19. Note all of the current information about the schedule, then delete it and recreate it.