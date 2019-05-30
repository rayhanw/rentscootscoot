const booking = () => {
  const bookingForm = document.querySelector('#new_booking > div');

  const startDateYear = document.querySelector('#booking_start_date_1i');
  const startDateMonth = document.querySelector('#booking_start_date_2i');
  const startDateDay = document.querySelector('#booking_start_date_3i');

  const endDateYear = document.querySelector('#booking_end_date_1i');
  const endDateMonth = document.querySelector('#booking_end_date_2i');
  const endDateDay = document.querySelector('#booking_end_date_3i');

  const days = document.getElementById('days');

  const price = document.querySelector('#price');

  bookingForm.addEventListener('click', (e) => {
    e.preventDefault();

    days.innerHTML = '';

    const basePrice = 42;
    const startYear = startDateYear.value;
    const startMonth = startDateMonth.value;
    const startDay = startDateDay.value;
    const endYear = endDateYear.value;
    const endMonth = endDateMonth.value;
    const endDay = endDateDay.value;

    const start = new Date(startYear, (startMonth - 1), startDay);
    const end = new Date(endYear, (endMonth - 1), endDay);

    const numberOfDays = ((end - start) / 86400000) + 1;

    const details = { days: numberOfDays, price: (basePrice * numberOfDays) };

    days.insertAdjacentHTML('afterbegin',
      `<strong>${details['days']}</strong> days = Rp ${details['price']}`);
  });
}

export { booking };
