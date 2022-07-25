require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many(:ticket_employees) }
    it { should have_many(:employees).through(:ticket_employees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:age) }
  end
end
