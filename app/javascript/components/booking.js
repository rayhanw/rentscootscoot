const price = document.querySelector('#scoot-price');
const days = document.getElementById('days');

const booking = () => {
  if (price != null) {
    const text = price.innerText
    const bookForm = document.querySelector('#new_booking');
    const startDate = document.getElementById('booking_start_date');
    const endDate = document.getElementById('booking_end_date');
    bookForm.addEventListener('change', (e) => {
      const actualPrice = Number.parseInt(text, 10);
      e.preventDefault();

      days.innerHTML = '';

      const start = new Date(startDate.value);
      const end = new Date(endDate.value);
      const numberOfDays = ((end - start) / 86400000) + 1;

      days.insertAdjacentHTML('afterbegin',
        `<strong>${numberOfDays}</strong> days = Rp. <strong>${actualPrice * numberOfDays}</strong>`
        );
    });
  }
}

export { booking };
