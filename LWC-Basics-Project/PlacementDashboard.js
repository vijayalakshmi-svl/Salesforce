import { LightningElement } from 'lwc';

export default class PlacementDashboard extends LightningElement {

    todaysDate = new Date().toLocaleDateString('en-IN', {
        day: 'numeric',
        month: 'long',
        year: 'numeric'
    });

    companies = 25;
    jobs = 63;
    applications = 5;

}
