{{ config(
    materialized='incremental',
    unique_key='booking_id'
) }}

select 
    BOOKING_ID,LISTING_ID,BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED','BOOKING_AMOUNT',2)}} + CLEANING_FEE + SERVICE_FEE AS TOTAL_AMOUNT,
    BOOKING_STATUS, CREATED_AT
 from {{ ref('bronze_bookings')}}